from django.shortcuts import render
from django.http import HttpResponse
from .models import Booking # . means from models file in current package
from django.views.generic import (
    ListView, DetailView, CreateView, UpdateView)
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.admin import widgets

class BookListView(ListView):
    model = Booking
    template_name = 'bookings/bookings.html'
    context_object_name = 'bookings'

class BookCreateView_Student(LoginRequiredMixin, CreateView):
    model = Booking
    fields = ['tutor', 'start_time', 'end_time', 'description', 'booking_type', 'pref_platform']

    def form_valid(self, form):
        form.instance.student = self.request.profile
        return super().form_valid(form)

class BookCreateView_Tutor(LoginRequiredMixin, CreateView):
    model = Booking
    fields = ['student', 'start_time', 'end_time', 'description', 'booking_type', 'pref_platform']

    def form_valid(self, form):
        form.instance.tutor = self.request.profile
        return super().form_valid(form)

    def get_form(self, form_class=None):
        form = super(BookCreateView_Tutor, self).get_form(form_class=None)
        form.fields['start_time'].widget = widgets.AdminSplitDateTime()
        form.fields['end_time'].widget = widgets.AdminSplitDateTime()
        return form




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