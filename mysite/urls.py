"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.conf.urls import url, include
from django.urls import path
from django.contrib.auth.views import LoginView
from mysite import views

urlpatterns = [
    url(r'^$', views.home_redirect, name = 'home_redirect'),
    path('admin/', admin.site.urls),
    url(r'^home/', include('accounts.urls')),
    url(r'^login/$', LoginView.as_view(template_name='accounts/login.html'),name='login'),
    # url(r'^home/$', LoginView.as_view(template_name='accounts/home.html'),name='home')
    # url(r'^new/$', views.new)
]
