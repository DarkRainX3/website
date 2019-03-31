from django.shortcuts import render, HttpResponse
# Create your views here.
def home(request):
    #communicate with django database queries here

    numbers = [1,2,3,4,5]
    name = 'student'

    args = {'myName': name, 'numbers':numbers}
    return render(request,'accounts/home.html', args)
def new(request):
    return render(request,'accounts/new.html')
