from django.db import models
from accounts.models import Profile
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator

# Create your models here.


class Meeting_Place(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    number = models.IntegerField()
    street = models.CharField(max_length=100)
    city = models.CharField(max_length=50)
    postal_code = models.CharField(max_length=6)
    is_private = models.BooleanField()
    #operation_schedule #not sure how to link or implement (should be to schedule but how?)


class Booking(models.Model):
    id = models.AutoField(primary_key=True)
    student_email = models.ForeignKey(Profile, on_delete=models.SET('email'), related_name='student_email') #double check
    tutor_email = models.ForeignKey(Profile, on_delete=models.SET('email')) #double check
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    description = models.CharField(max_length=250)
    booking_type = models.CharField(max_length=10)
    pref_platform = models.CharField(max_length=50)
    meeting_place_id = models.ForeignKey(Meeting_Place, on_delete="CASCADE")
    commute_fee = models.FloatField()

class Invoice(models.Model):
    id = models.AutoField(primary_key=True)
    booking_id = models.OneToOneField(Booking, to_field='id', on_delete="CASCADE")
    amount = models.FloatField()


class Review(models.Model):
    id = models.AutoField(primary_key=True)
    invoice_id = models.OneToOneField(Invoice, to_field='id', on_delete="CASCADE")
    reviewer = models.OneToOneField(Profile, to_field='email', on_delete="CASCADE", related_name='reviewer')
    reviewee = models.OneToOneField(Profile, to_field='email', on_delete="CASCADE", related_name='reviewee')
    overall_rating = models.IntegerField(validators=[MaxValueValidator(0), MinValueValidator(5)])
    knowledge = models.CharField(max_length=100)
    explanation = models.CharField(max_length=250)

class Booking_Message_Logs(models.Model):
    pass

class Booking_Offer(models.Model):
    pass
class Message(models.Model):
    pass

class Schedule(models.Model):
    #booking_id = models.ManyToManyField(Booking, )
    pass

class Scheduled_Booking(Booking):
    pass

class Refund_Request:
    id = models.AutoField(primary_key=True)
    invoice_id = models.OneToOneField(Invoice, to_field='id', on_delete="CASCADE")
    reason = models.CharField(max_length=250)
    amount = models.FloatField()

class Meeting(models.Model):
    pass

class Desired_Meeting_Place(Meeting):
    pass

