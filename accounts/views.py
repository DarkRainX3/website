from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from accounts.forms import RegForm
# Create your views here.
def home(request):
    #communicate with django database queries here

    numbers = [1,2,3,4,5]
    name = 'student'

    args = {'myName': name, 'numbers':numbers}
    return render(request,'accounts/home.html', args)

def new(request):
    return render(request,'accounts/new.html')

def register(request):
    if request.method=="POST":
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/home')
    else:
        form = UserCreationForm()
        args = {'form':form}
        return render(request, 'accounts/register.html',args)
