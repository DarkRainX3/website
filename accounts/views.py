from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from accounts.forms import RegProfile
import datetime
# Create your views here.
def home(request):
    #communicate with django database queries here

    numbers = [1,2,3,4,5]
    name = 'student'

    args = {'myName': name, 'numbers':numbers}
    return render(request,'accounts/home.html', args)

def new(request):
    return render(request,'accounts/new.html')

def about(request):
    return render(request,'accounts/about.html')

def register(request):
    if request.method=="POST":
        profile_creation_form = RegProfile(request.POST)
        user_creation_form = UserCreationForm(request.POST)
        if profile_creation_form.is_valid() and user_creation_form.is_valid():
            u = user_creation_form.save()
            profile_creation_form = RegProfile(request.POST, instance=u.user_profile)
            profile_creation_form.is_valid()
            profile_creation_form.save()
            # profile = profile_creation_form.save(commit=False)
            # profile.user = u
            # profile.save()

            return redirect('/home')
    else:
        profile_creation_form = RegProfile()
        user_creation_form= UserCreationForm()

    args = {'profile_creation_form':profile_creation_form, 'user_creation_form':user_creation_form}
    return render(request, 'accounts/select.html',args)
    return render(request, 'accounts/register.html',args)

def registerT(request):
    if request.method=="POST":
        profile_creation_form = RegProfile(request.POST)
        user_creation_form = UserCreationForm(request.POST)
        if profile_creation_form.is_valid() and user_creation_form.is_valid():
            u = user_creation_form.save()
            profile_creation_form = RegProfile(request.POST, instance=u.user_profile)
            profile_creation_form.is_valid()
            profile_creation_form.save()
            # profile = profile_creation_form.save(commit=False)
            # profile.user = u
            # profile.save()

            return redirect('/home')
    else:
        profile_creation_form = RegProfile()
        user_creation_form= UserCreationForm()

    args = {'profile_creation_form':profile_creation_form, 'user_creation_form':user_creation_form}
    return render(request, 'accounts/registerT.html',args)

def registerS(request):
    if request.method=="POST":
        profile_creation_form = RegProfile(request.POST)
        user_creation_form = UserCreationForm(request.POST)
        if profile_creation_form.is_valid() and user_creation_form.is_valid():
            u = user_creation_form.save()
            profile_creation_form = RegProfile(request.POST, instance=u.user_profile)
            profile_creation_form.is_valid()
            profile_creation_form.save()
            # profile = profile_creation_form.save(commit=False)
            # profile.user = u
            # profile.save()

            return redirect('/home')
    else:
        profile_creation_form = RegProfile()
        user_creation_form= UserCreationForm()

    args = {'profile_creation_form':profile_creation_form, 'user_creation_form':user_creation_form}
    return render(request, 'accounts/register.html',args)

# def profile(request, pid):
#     today = datetime.datetime.now().date()
#     args = {'pid':pid, "today":today}
#     return render(request, 'accounts/profile.html',args)

def profile(request):
    return render(request, 'accounts/profile.html')