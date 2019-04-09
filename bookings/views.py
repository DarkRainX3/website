from django.shortcuts import render, redirect
from django.http import HttpResponse
from .models import Booking # . means from models file in current package
from django.views.generic import (
    ListView, DetailView, CreateView, UpdateView)
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.admin import widgets
from accounts.models import Profile
from django.urls import reverse
from django.contrib import messages

class BookListView(ListView):
    model = Booking
    template_name = 'bookings/bookings.html'
    context_object_name = 'bookings'

class BookCreateView_Student(LoginRequiredMixin, CreateView):
    model = Booking
    fields = ['tutor', 'start_time', 'end_time', 'description', 'booking_type', 'pref_platform']

    def form_valid(self, form):
        instance = form.save(commit=False)
        instance.student = self.request.user.profile
        instance.save()
        return super().form_valid(instance)

    def get_form(self, form_class=None):
        form = super(BookCreateView_Student, self).get_form(form_class=None)
        form.fields['start_time'].help_text='YYYY-MM-DD hh:mm'
        # form.fields['start_time'].widget = widgets.AdminSplitDateTime()
        # form.fields['end_time'].widget = widgets.AdminSplitDateTime()
        return form

    def get_success_url(self):
        messages.success(self.request, 'Booking created successfully')
        return reverse('home_redirect')


class BookCreateView_Tutor(LoginRequiredMixin, CreateView):
    model = Booking
    fields = ['student', 'start_time', 'end_time', 'description', 'booking_type', 'pref_platform']

    def form_valid(self, form):
        # form.instance.created_by = self.request.user
        instance = form.save(commit=False)
        instance.created_by = self.request.user
        instance.save()
        return super().form_valid(form)


    def get_form(self, form_class=None):
        form = super(BookCreateView_Tutor, self).get_form(form_class=None)
        # form.fields['start_time'].widget = widgets.AdminSplitDateTime()
        # form.fields['end_time'].widget = widgets.AdminSplitDateTime()
        #form.fields['student'].queryset = Profile.objects.filter(self.request.user)
        return form

    def get_success_url(self):
        messages.success(self.request, 'Profile Updated Successfully')
        return reverse('home_redirect')


# class TutorSearchView(ListView):
#     model = Profile
#     template_name = 'bookings/search.html'
#     fields = ['first_name', 'last_name', 'education_level']
#     context_object_name = 'search'
#
#     def get(self, request, *args, **kwargs):
#         q = request.GET.get('q', '')
#         self.results = Profile.objects.filter(name__icontains=q)
#         return super().get(request, *args, **kwargs)
#
#     def get_context_data(self, **kwargs):
#         return super().get_context_data(results=self.results, **kwargs)
#
#     def get_queryset(self):
#         try:
#             name = self.kwargs['first_name']
#         except:
#             name = ''
#         if (name != ''):
#             object_list = self.model.objects.filter(name__icontains=name)
#         else:
#             object_list = self.model.objects.all()
#         return object_list

# class Booking(models.Model):
#     id = models.AutoField(primary_key=True)
#     student_email = models.ForeignKey(Profile, on_delete=models.SET('email'), related_name='student_email') #double check
#     tutor_email = models.ForeignKey(Profile, on_delete=models.SET('email')) #double check
#     start_time = models.DateTimeField()
#     end_time = models.DateTimeField()
#     description = models.CharField(max_length=250)
#     booking_type = models.CharField(max_length=10)
#     pref_platform = models.CharField(max_length=50)
#     #meeting_place_id = models.ForeignKey(Meeting_Place, on_delete="CASCADE")
#     commute_fee = models.FloatField()