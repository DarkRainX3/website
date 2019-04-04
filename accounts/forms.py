from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from accounts import models
"""https://simpleisbetterthancomplex.com/tutorial/2018/11/28/advanced-form-rendering-with-django-crispy-forms.html"""
"""https://getbootstrap.com/docs/4.1/components/forms/#form-row"""
"""https://simpleisbetterthancomplex.com/tutorial/2018/08/13/how-to-use-bootstrap-4-forms-with-django.html"""
"""https://www.tutorialspoint.com/django/django_form_processing.htm"""
"""https://simpleisbetterthancomplex.com/tutorial/2019/01/03/how-to-use-date-picker-with-django.html"""

class RegForm(UserCreationForm):
    email = forms.EmailField(required = True)

    class Meta:
        model = User
        fields = (
            "username",
            'first_name',
            'last_name',
            'email',
            'password1',
            'password2'
        )
        # required_fields =(
        #
        # )

    def save(self, commit = True):
        user = super(RegForm, self).save(commit=False)
        user.first_name=self.cleaned_data['first_name']#prevent sql inject
        user.last_name=self.cleaned_data['last_name']
        user.email=self.cleaned_data['email']
        if commit:
            user.save()

        return user


class RegProfile(forms.ModelForm):
    class Meta:
        model = models.UserProfile
        # fields = (
        #     'city',
        #     'description'
        # )
        exclude = ('user',)
        # widgets = {
        #     "date": DateInput()
        # }
