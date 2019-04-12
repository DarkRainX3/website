from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.urls import reverse

from .forms import UserRegisterForm, UserUpdateForm, ProfileUpdateForm
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth.models import User
from django.db import IntegrityError
import datetime
from .models import Profile
from django.views.generic import (
    ListView, DetailView, CreateView, UpdateView)
from django.contrib.auth.mixins import LoginRequiredMixin
from .models import Known_subject
from .models import Subject
from django.shortcuts import get_object_or_404
# Create your views here.



def home(request):
    subjects = Subject.objects.all()

    context = {'subjects':subjects

    }
    return render(request,'home.html', context)

def new(request):
    return render(request,'accounts/new.html')


def about(request):
    return render(request,'about.html')


def register(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, f'Your account has been created! You are now able to log in')
            return redirect('login')

    else:
        form = UserRegisterForm()

    return render(request, 'accounts/register.html', {'form': form})


@login_required
def profile(request):
    if request.method == 'POST':
        u_form = UserUpdateForm(request.POST, instance=request.user)
        p_form = ProfileUpdateForm(request.POST,
                                   request.FILES,
                                   instance=request.user.profile)
        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            messages.success(request, f'Your account has been updated!')
            return redirect('profile')

    else:
        u_form = UserUpdateForm(instance=request.user)
        p_form = ProfileUpdateForm(instance=request.user.profile)

    context = {
        'u_form': u_form,
        'p_form': p_form
    }

    return render(request, 'accounts/profile.html', context)


def search(request):
    query = request.GET.get('q')
    qs = Profile.objects.all()
    subs = Known_subject.objects.all()
    if query is not None:
        qs = qs.filter(user__first_name__icontains=query).filter(tutor_flag__exact=True)
        subs = subs.filter(subject_creator__first_name__icontains=query)
    context={
        'tutors': qs,
        'subs': subs
    }
    return render(request, 'accounts/search.html', context)


# def subject_search(request):
#     if request.method == 'POST':



class SubjectCreateView(LoginRequiredMixin, CreateView):
    model = Known_subject
    template_name = 'accounts/subject_form.html'
    fields = ['subject', 'knowledge_level', 'school', 'graduation_year', 'gpa', 'specialty']

    def form_valid(self, form):
        instance = form.save(commit=False)
        instance.subject_creator = self.request.user
        instance.save()
        return super().form_valid(form)

    def get_success_url(self):
        messages.success(self.request, 'Subjects created successfully')
        return reverse('home_redirect')

class SubjectListView(LoginRequiredMixin, ListView):
    model = Known_subject
    template_name = 'accounts/subject_list.html'
    context_object_name = 'subjects'

class ProfileDetailView(LoginRequiredMixin, DetailView):
    model = Profile

    def get_queryset(self):
        return Profile.objects.filter(id=self.kwargs['pk'])

    # def get_context_data(self, **kwargs):
    #     context = super(ProfileDetailView, self).get_context_data(**kwargs)
    #     context['k_subjects'] = Known_subject.objects.filter(subject_creator=Profile.user)
    #     return context

class ChooseSubject(LoginRequiredMixin, ListView):
    model = Known_subject
    template_name = 'accounts/choose_subject.html'
    context_object_name = 'subjects'

    def get_queryset(self):
        return Known_subject.objects.filter(subject=self.kwargs['name'])



# class Subject(models.Model):
#     name = models.CharField(max_length=50, primary_key=True)
#     tutor = models.ManyToManyField(Profile, through='Tutor_Subjects')
#
# class Tutor_Subjects(models.Model):
#     tutor = models.ForeignKey(Profile, on_delete="CASCADE")
#     subject = models.ForeignKey(Subject, on_delete="CASCADE")
#
# class Known_subject(models.Model): #removed subject as primary key?
#     id = models.AutoField(primary_key=True, default="")
#     subject = models.ForeignKey(Subject, on_delete="CASCADE")
#     knowledge_level = models.CharField(max_length=50)
#     school = models.CharField(max_length=100)
#     graduation_year = models.IntegerField(validators=[MaxValueValidator(2050), MinValueValidator(1900)])
#     gpa = models.FloatField(validators=[MaxValueValidator(0), MinValueValidator(5.0)])


# def register(request):
#     if request.method=="POST":
#         profile_creation_form = RegProfile(request.POST)
#         user_creation_form = UserCreationForm(request.POST)
#         if profile_creation_form.is_valid() and user_creation_form.is_valid():
#             u = user_creation_form.save()
#             profile_creation_form = RegProfile(request.POST, instance=u.user_profile)
#             profile_creation_form.is_valid()
#             profile_creation_form.save()
#             # profile = profile_creation_form.save(commit=False)
#             # profile.user = u
#             # profile.save()
#
#             return redirect('/home')
#     else:
#         profile_creation_form = RegProfile()
#         user_creation_form= UserCreationForm()
#
#     args = {'profile_creation_form':profile_creation_form, 'user_creation_form':user_creation_form}
#     return render(request, 'accounts/select.html',args)
#     return render(request, 'accounts/register.html',args)

# def registerT(request):
#     if request.method=="POST":
#         profile_creation_form = RegProfile(request.POST)
#         user_creation_form = UserCreationForm(request.POST)
#         if profile_creation_form.is_valid() and user_creation_form.is_valid():
#             profile_creation_form.student_flag = False
#             profile_creation_form.tutor_flag = True
#             u = user_creation_form.save()
#             profile_creation_form = RegProfile(request.POST, instance=u.user_profile)
#             profile_creation_form.is_valid()
#             profile_creation_form.save()
#             # profile = profile_creation_form.save(commit=False)
#             # profile.user = u
#             # profile.save()
#
#             return redirect('/home')
#     else:
#         profile_creation_form = RegProfile()
#         user_creation_form= UserCreationForm()
#
#     args = {'profile_creation_form':profile_creation_form, 'user_creation_form':user_creation_form}
#     return render(request, 'accounts/registerT.html',args)
#
# def registerS(request):
#     if request.method=="POST":
#         user_creation_form = UserCreationForm(request.POST, instance=request.user)
#         profile_creation_form = RegProfile(request.POST, instance=request.user.profile)
#
#         if profile_creation_form.is_valid() and user_creation_form.is_valid():
#             profile_creation_form.student_flag = True
#             profile_creation_form.tutor_flag = False
#             u = user_creation_form.save()
#             # profile_creation_form = RegProfile(request.POST, instance=u.profile)
#             # profile_creation_form.is_valid()
#             profile_creation_form.save()
#
#             # profile = profile_creation_form.save(commit=False)
#             # profile.user = u
#             # profile.save()
#
#             return redirect('/home')
#     else:
#         user_creation_form = UserCreationForm(instance=request.user)
#         profile_creation_form = RegProfile(instance=request.user.profile)
#
#     args = {'profile_creation_form':profile_creation_form, 'user_creation_form':user_creation_form}
#     return render(request, 'accounts/register.html',args)

# def profile(request, pid):
#     today = datetime.datetime.now().date()
#     args = {'pid':pid, "today":today}
#     return render(request, 'accounts/profile.html',args)

# @login_required
# def profile(request):
#     return render(request, 'accounts/profile.html')