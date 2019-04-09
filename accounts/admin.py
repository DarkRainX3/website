from django.contrib import admin
from accounts.models import Profile, Subject, Tutor_Verification, Dependent
# Register your models here.


admin.site.register(Profile)
admin.site.register(Subject)
admin.site.register(Tutor_Verification)
admin.site.register(Dependent)

