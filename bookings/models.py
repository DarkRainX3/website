from django.db import models
from accounts.models import Profile, Known_subject
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator
from django.urls import reverse
from django.core.exceptions import ValidationError
from django.utils import timezone
from datetime import datetime
from django.db.models import Avg
#from smart_selects.db_fields import ChainedForeignKey

# Create your models here.

platform_choices = (('Online', 'Online'), ('In-Person', 'In-Person'))

class Meeting_Place(models.Model):
    name = models.CharField(max_length=100, unique=True)
    number = models.IntegerField()
    street = models.CharField(max_length=100)
    city = models.CharField(max_length=50)
    postal_code = models.CharField(max_length=6)
    is_private = models.BooleanField()


    # def get_absolute_url(self):
    #     return reverse('places', kwargs={'pk': self.pk})

    def __str__(self):
        return self.name


class Booking(models.Model):
    student = models.ForeignKey(Profile, on_delete=models.CASCADE, related_name='student_book', limit_choices_to={'student_flag':True}, to_field='user', null=True) #double check
    tutor = models.ForeignKey(Profile, on_delete=models.CASCADE, related_name='tutor_book', limit_choices_to={'tutor_flag':True}, to_field='user', null=True) #double check
    start_time = models.DateTimeField(help_text='YYYY-MM-DD hh:mm')
    end_time = models.DateTimeField(help_text='YYYY-MM-DD hh:mm')
    price = models.FloatField()
    description = models.CharField(max_length=250)
    pref_platform = models.CharField(max_length=50, choices=platform_choices)
    location = models.ForeignKey(Meeting_Place, on_delete=models.CASCADE, null=True, blank=True, to_field='name')
    transaction_time = models.DateTimeField(default=0)
    hours = models.FloatField(default=0)

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse('book', kwargs={'pk': self.pk})

    @property
    def price(self):
        return (self.end_time - self.start_time).total_seconds() / (60*60) * self.tutor.rate

    @property
    def hours(self):
        return (self.end_time - self.start_time).total_seconds() / (60*60)

    def clean(self, *args, **kwargs):
        super(Booking, self).clean(*args, **kwargs)

        errors = {}

        if self.start_time < timezone.now():
            errors['start_time'] = 'Start time must be later than now!\n'

        if self.end_time < self.start_time:
            errors['end_time'] = 'End time must be after than start time!\n'

        # if self.tutor == self.created_by.profile:
        #     errors['tutor'] = "You can't book yourself!\n"

        if self.pref_platform == 'Online' and self.location is not None:
            errors['pref_platform'] = "Online has no location!\n"

        if bool(errors):
            raise ValidationError(errors)


    #meeting_place_id = models.ForeignKey(Meeting_Place, on_delete=models.CASCADE)
    #commute_fee = models.FloatField()

    # def fullname_student(self):
    #     return "%s %s" % (self.student.first_name, self.student.last_name)
    #
    # def fullname_tutor(self):
    #     return "%s %s" % (self.tutor.first_name, self.tutor.last_name)

class Invoice(models.Model):
    booking = models.OneToOneField(Booking, to_field='id', on_delete=models.CASCADE, null=True)
    tax = models.FloatField(default=0)
    total = models.FloatField(default=0)


    def get_absolute_url(self):
        return reverse('invoice-detail', kwargs={'pk': self.pk})

class Review(models.Model):
    id = models.AutoField(primary_key=True)
    booking = models.ForeignKey(Booking, to_field='id', on_delete=models.CASCADE, null=True, unique=True)
    reviewer = models.OneToOneField(Profile, on_delete=models.CASCADE, related_name='reviewer', null=True)
    reviewee = models.OneToOneField(Profile, on_delete=models.CASCADE, related_name='reviewee', null=True)
    overall_rating = models.IntegerField(validators=[MaxValueValidator(5), MinValueValidator(0)])
    explanation = models.CharField(max_length=250)

    def get_absolute_url(self):
        return reverse('reviews', kwargs={'pk': self.pk})


class Message(models.Model):
    id = models.AutoField(primary_key=True)
    sender = models.ForeignKey(Profile, related_name='sender', on_delete=models.CASCADE, null=True)
    recipient = models.ForeignKey(Profile, related_name='recipient', on_delete=models.CASCADE, null=True)
    content = models.TextField(null=True)
    sent_at = models.DateTimeField(default=datetime.now, blank=True)


    def get_absolute_url(self):
        return reverse('messages', kwargs={'pk': self.pk})

    def __str__(self):
        return self.content




class Schedule(models.Model):
    #booking_id = models.ManyToManyField(Booking, )
    pass

class Scheduled_Booking(Booking):
    pass

class Refund_Request:
    id = models.AutoField(primary_key=True)
    invoice_id = models.OneToOneField(Invoice, to_field='id', on_delete=models.CASCADE)
    reason = models.CharField(max_length=250)
    amount = models.FloatField()
    status = models.CharField(default='Submitted')



class Meeting(models.Model):
    pass

class Desired_Meeting_Place(Meeting):
    pass

