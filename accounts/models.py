from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.core.validators import MinValueValidator, MaxValueValidator


# Create your models here.
class UserProfile(models.Model):
    user = models.OneToOneField(User,on_delete="CASCADE")
    description = models.CharField(max_length=100,default='')
    city = models.CharField(max_length=100,default='')

def createProfile(sender,**kwargs):
    if kwargs['created']:
        user_profile = UserProfile.objects.create(user=kwargs['instance'])



class User(models.Model):
    email = models.CharField(max_length=100, blank=False, unique=True, primary_key=True)
    password = models.CharField(max_length=100, blank=False)
    birth_date = models.DateField(max_length=8)
    education_level = models.CharField(max_length=100, default='')
    first_name = models.CharField(max_length=50)
    middle_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    student_flag = models.BooleanField()
    tutor_flag = models.BooleanField()

    def __str__(self):
        return self.email

class Subject(models.Model):
    name = models.CharField(max_length=50, primary_key=True)


class Known_subject(Subject): #removed subject as primary key?
    subject = models.OneToOneField(Subject, parent_link=True, on_delete="CASCADE")
    tutor = models.ManyToManyField(User, on_delete='CASCADE', parent_link=True, primary_key=True)
    knowledge_level = models.CharField(max_length=50)
    school = models.CharField(max_length=100)
    graduation_year = models.IntegerField(validators=[MaxValueValidator(2050), MinValueValidator(1900)])
    gpa = models.FloatField(validators=[MaxValueValidator(0), MinValueValidator(5.0)])


class Specialty_Subject(Subject):
    subject = models.OneToOneField(Subject, parent_link=True, on_delete="CASCADE", primary_key=True)
    speciality = models.CharField(max_length=50)

class Tutor_Verification(models.Model):
    email = models.OneToOneField(User, to_field=User.email, primary_key=True)
    verification = models.CharField(max_length=100)

class Dependent(models.Model):
    parent_email = models.OneToOneField(User, to_field=User.email, primary_key=True)
    first_name = models.CharField(max_length=50)
    middle_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)

class Tutor_Teach_Student(models.Model): #not sure if this table is correct
    tutor = models.OneToOneField(User, to_field=User.email)
    student = models.OneToOneField(User, to_field=User.email)

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
    student_email = models.ForeignKey(User, on_delete=models.SET(User.email)) #double check
    tutor_email = models.ForeignKey(User, on_delete=models.SET(User.email)) #double check
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    description = models.CharField(max_length=250)
    booking_type = models.CharField(max_length=10)
    pref_platform = models.CharField(max_length=50)
    meeting_place_id = models.ForeignKey(Meeting_Place, on_delete="CASCADE")
    commute_fee = models.FloatField()

class Invoice(models.Model):
    id = models.AutoField(primary_key=True)
    booking_id = models.OneToOneField(Booking, to_field=Booking.id)
    amount = models.FloatField()


class Review(models.Model):
    id = models.AutoField(primary_key=True)
    invoice_id = models.OneToOneField(Invoice, to_field=Invoice.id)
    reviewer = models.OneToOneField(User, to_field=User.first_name)
    reviewee = models.OneToOneField(User, to_field=User.first_name)
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
    booking_id = models.ManyToManyField(Booking, )

class Scheduled_Booking(Booking):
    pass

class Refund_Request:
    id = models.AutoField(primary_key=True)
    invoice_id = models.OneToOneField(Invoice, to_field=Invoice.id)
    reason = models.CharField(max_length=250)
    amount = models.FloatField()

class Meeting(models.Model):
    pass

class Desired_Meeting_Place(Meeting):
    pass


post_save.connect(createProfile,sender=User)


# gotta do manage.py makemigrations to create the new models
# then do manage.py migrate to implement them to server
