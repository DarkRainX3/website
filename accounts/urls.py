
from django.conf.urls import url
from django.urls import path
from . import views
from django.contrib.auth.views import LoginView, LogoutView


urlpatterns = [
    url(r'^$', views.home),
    url(r'^test/$', views.new),
    url(r'^search/', views.search, name='search'),
    url(r'^logout/$', LogoutView.as_view(template_name='accounts/logout.html'),name='logout'),
    url(r'^register/$', views.register,name = 'register'),
    url(r'^about/$', views.about,name = 'about'),
    path('profile/', views.profile, name='profile'),
    url(r'^subject_list/$', views.SubjectListView.as_view(), name='subject_list'),
    url(r'^add_subjects/$', views.SubjectCreateView.as_view(), name='add_subjects'),
    path('profile/<int:pk>/', views.ProfileDetailView.as_view(), name='profile-detail'),
    path('choose_subject/<name>/', views.ChooseSubject.as_view(), name='subject-choose'),
    path('add_dependent/', views.DependentCreateView.as_view(), name='add_dep'),
    path('dependent/', views.DependentListView.as_view(), name='deps'),
    path('dependent/<int:pk>/', views.DependentUpdateView.as_view(), name='update-dep'),
    path('dependent/<int:pk>/delete', views.DependentDeleteView.as_view(), name='del-dep'),
    path('verification/<int:pk>/', views.VerificationDetailView.as_view(), name='verify'),
    path('new_verification/', views.VerificationCreateView.as_view(), name='verify-form'),



]
