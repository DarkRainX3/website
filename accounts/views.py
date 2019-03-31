from django.shortcuts import render, HttpResponse
# Create your views here.
def home(request):
    #communicate with django database queries here

    numbers = [1,2,3,4,5]
    name = 'Andy Wu'

    args = {'myName': name, 'numbers':numbers}
    return render(request,'accounts/home.html', args)
