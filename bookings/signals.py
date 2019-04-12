from django.db.models.signals import post_save
from bookings.models import Booking, Invoice
from django.dispatch import receiver


# @receiver(post_save, sender=Booking)
# def create_invoice(sender, instance, created, **kwargs):
#     if created:
#         Invoice.objects.create(booking_id=instance)