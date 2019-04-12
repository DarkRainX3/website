from django.contrib import admin
from .models import Booking, Meeting_Place, Invoice
# Register your models here.

admin.site.register(Booking)
admin.site.register(Meeting_Place)
admin.site.register(Invoice)