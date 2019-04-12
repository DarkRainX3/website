
from django.conf.urls import url
from django.urls import path
from . import views
from django.contrib.auth.views import LoginView, LogoutView



urlpatterns = [
    url(r'^$', views.home),
    url(r'^test/$', views.new),
    url(r'^logout/$', LogoutView.as_view(template_name='accounts/logout.html'),name='logout'),
    url(r'^register/$', views.register,name = 'register'),
    url(r'^registerS/$', views.registerS,name = 'registerStudent'),
    url(r'^registerT/$', views.registerT,name = 'registerTutor'),
    url(r'^about/$', views.about,name = 'about'),
    #url(r'^profile/(\w+)/', views.profile, name = 'profile'),
    path('profile/', views.profile, name='profile'),
]
