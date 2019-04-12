from django.shortcuts import render, redirect
from django.http import HttpResponse
from .models import Booking, Known_subject, Invoice, Review, Meeting_Place
from django.views.generic import (
    ListView, DetailView, CreateView, UpdateView, DeleteView)
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.admin import widgets
from accounts.models import Profile
from django.urls import reverse
from django.contrib import messages
from django.core.exceptions import ValidationError
from django.utils import timezone

class BookListView(ListView):
    model = Booking
    template_name = 'bookings/bookings.html'
    context_object_name = 'bookings'

class BookCreateView_Student(LoginRequiredMixin, CreateView):
    model = Booking
    fields = ['tutor', 'start_time', 'end_time', 'description', 'pref_platform', 'location']


    # def __init__(self, *args, **kwargs):
    #     tutor = kwargs.pop('tutor', None)
    #     if tutor is None:
    #         tutor = self.fields['tutor'].current
    #     super(BookCreateView_Student, self).__init__(*args, **kwargs)
    #     self.fields['price'] = tutor.rate
    #     self.fields['price'].disabled = True

    # def get_initial(self, *args, **kwargs):
    #     initial = super(BookCreateView_Student, self).get_initial(**kwargs)
    #     initial['created_by'] = self.request.user
    #     return initial


    def form_valid(self, form):
        instance = form.save(commit=False)
        instance.student = self.request.user.profile
        instance.transaction_time = timezone.now()
        instance.save()
        tax = instance.price * 0.05
        price = instance.price + tax
        invoice = Invoice.objects.create(booking_id=instance.id, total=price, tax=tax)

        return super().form_valid(instance)

    # def get_form(self, form_class=None):
    #     form = super(BookCreateView_Student, self).get_form(form_class=None)
    #     form.initial['created_by'] = self.request.user
    #     return form

    # def get_form_kwargs(self, *args, **kwargs):
    #     form = super(BookCreateView_Student, self).get_form_kwargs(*args, **kwargs)
    #     form['created_by'] = self.request.user
    #     # tutor =
    #     # form.fields['subject'].queryset = Known_subject.objects.filter(subject_creator=form.get('tutor'))
    #     return form

    def get_success_url(self):
        messages.success(self.request, 'Booking created successfully')
        return reverse('home_redirect')

class BookUpdateView(LoginRequiredMixin, UpdateView):
    model = Booking
    template_name = 'bookings/booking_form.html'
    fields = ['tutor', 'start_time', 'end_time', 'description', 'pref_platform', 'location']

    def get_success_url(self):
        messages.success(self.request, 'Booking updated successfully')
        return reverse('book')


class BookDeleteView(DeleteView):
    model = Booking
    template_name = 'delete.html'
    context_object_name = 'booking'

    def get_success_url(self):
        messages.success(self.request, 'Booking deleted successfully')
        return reverse('book')


class BookDetailView(LoginRequiredMixin, DetailView):
    model = Booking


class InvoiceDetailView(LoginRequiredMixin, DetailView):
    model = Invoice
    template_name = 'bookings/invoice-detail.html'
    context_object_name = 'invoice'


class InvoiceListView(LoginRequiredMixin, ListView):
    model = Invoice
    template_name = 'bookings/invoices.html'
    context_object_name = 'invoices'

class MeetingCreateView(LoginRequiredMixin, CreateView):
    model = Meeting_Place
    template_name = 'bookings/new_place.html'
    fields = ['name', 'number', 'street', 'city', 'postal_code', 'is_private']


    def get_success_url(self):
        messages.success(self.request, 'Booking updated successfully')
        return reverse('places')

class MeetingListView(LoginRequiredMixin, ListView):
    model = Meeting_Place
    template_name = 'bookings/meeting_places'
    context_object_name = 'meeting'


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