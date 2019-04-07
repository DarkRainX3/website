
from django.conf.urls import url
from django.urls import path
from . import views
from .views import PostListView

urlpatterns = [
    path('bookings/', PostListView.as_view(), name='bookings'),
]
