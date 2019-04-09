
from django.conf.urls import url
from django.urls import path

from .views import BookListView, BookCreateView_Student, BookCreateView_Tutor

urlpatterns = [
    path('bookings/', BookListView.as_view(), name='book'),
    path('bookings/booking_form', BookCreateView_Student.as_view(), name='student_book'),
    path('bookings/booking_form2', BookCreateView_Tutor.as_view(), name='tutor_book'),

]

