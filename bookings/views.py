from django.shortcuts import render
from django.http import HttpResponse
from .models import Booking # . means from models file in current package
from django.views.generic import (
    ListView, DetailView, CreateView, UpdateView)
from django.contrib.auth.mixins import LoginRequiredMixin

class PostListView(ListView):
    model = Booking
    template_name = ''
