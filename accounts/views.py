from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from .forms import UserRegisterForm, UserUpdateForm, ProfileUpdateForm
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.db import IntegrityError
import datetime
# Create your views here.



def home(request):
    #communicate with django database queries here

    numbers = [1,2,3,4,5]
    name = 'student'

    args = {'myName': name, 'numbers':numbers}
    return render(request,'home.html', args)

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