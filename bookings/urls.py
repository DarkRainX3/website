
from django.conf.urls import url
from django.urls import path

from .views import *


urlpatterns = [
    path('bookings/', BookListView.as_view(), name='book'),
    path('bookings/booking_form', BookCreateView_Student.as_view(), name='student_book'),
    #path('bookings/booking_form2', BookCreateView_Tutor.as_view(), name='tutor_book'),
    path('bookings/<int:pk>/', BookDetailView.as_view(), name='book-detail'),
    path('bookings/<int:pk>/update', BookUpdateView.as_view(), name='book-update'),
    path('bookings/<int:pk>/delete', BookDeleteView.as_view(), name='book-delete'),
    path('invoices/', InvoiceListView.as_view(), name='invoice'),
    path('invoices/<int:pk>/', InvoiceDetailView.as_view(), name='invoice-detail'),
    path('meeting_places/', MeetingListView.as_view(), name='places'),
    path('new_place/', MeetingCreateView.as_view(), name='create-place'),
    path('new_review/', ReviewCreateView.as_view(), name='new-review'),
    path('reviews/', ReviewListView.as_view(), name='reviews'),
    path('new_message/', MessageCreateView.as_view(), name='new-message'),
    path('messages/', MessageListView.as_view(), name='messages'),
    path('messages/outbox/', OutboxListView.as_view(), name='messages-outbox'),
]

