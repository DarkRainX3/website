from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import Profile
"""https://simpleisbetterthancomplex.com/tutorial/2018/11/28/advanced-form-rendering-with-django-crispy-forms.html"""
"""https://getbootstrap.com/docs/4.1/components/forms/#form-row"""
"""https://simpleisbetterthancomplex.com/tutorial/2018/08/13/how-to-use-bootstrap-4-forms-with-django.html"""
"""https://www.tutorialspoint.com/django/django_form_processing.htm"""
"""https://simpleisbetterthancomplex.com/tutorial/2019/01/03/how-to-use-date-picker-with-django.html"""

class UserRegisterForm(UserCreationForm):
    email = forms.EmailField(required = True)
    first_name = forms.CharField(required=True)
    last_name = forms.CharField(required=True)

    class Meta:
        model = User
        fields = (
            'username',
            'email',
            'first_name',
            'last_name',
            'password1',
            'password2'
        )
        # required_fields =(
        #
        # )

class UserUpdateForm(forms.ModelForm):
    email = forms.EmailField()

    class Meta:
        model = User
        fields = ['username', 'email', 'first_name', 'last_name']

class ProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['city', 'description', 'education_level', 'student_flag', 'tutor_flag', 'image']



    # def save(self, commit = True):
    #     user = super(RegForm, self).save(commit=False)
    #     user.first_name=self.cleaned_data['first_name']#prevent sql inject
    #     user.last_name=self.cleaned_data['last_name']
    #     user.email=self.cleaned_data['email']
    #     if commit:
    #         user.save()
    #
    #     return user


# class RegProfile(forms.ModelForm):
#     class Meta:
#         model = Profile
#         fields = ['description', 'city', 'image','education_level']
#
#         # fields = (
#         #     'city',
#         #     'description'
#         # )
#         exclude = ('user','student_flag','tutor_flag')
#         # widgets = {
#         #     "date": DateInput()
#         # }
