from django.conf.urls import url
from . import views
from django.contrib.auth.views import LoginView, LogoutView

urlpatterns = [
    url(r'^$', views.home),
    url(r'^test/$', views.new),
    url(r'^logout/$', LogoutView.as_view(template_name='accounts/logout.html'),name='logout'),
    url(r'^register/$', views.register,name = 'register')
    # url(r'^logout/$', logout, {"template_name":'accounts/logout.html'})
]
