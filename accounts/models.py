from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.core.validators import MinValueValidator, MaxValueValidator
from PIL import Image


# Create your models here.
class Profile(models.Model):
    user = models.OneToOneField(User,on_delete="CASCADE")
    # first_name = models.CharField(max_length=50, default='First Name')
    # last_name = models.CharField(max_length=50, default='Last Name')
    # email = models.EmailField(unique=True, primary_key=True, null=False, default='')
    description = models.CharField(max_length=100, null=True)
    city = models.CharField(max_length=100,default='')
    image = models.ImageField(default='default.jpg', upload_to='profile_pics')
    education_level = models.CharField(max_length=100, default='')
    student_flag = models.BooleanField(default=False)
    tutor_flag = models.BooleanField(default=False)

    def __str__(self):
        return "%s %s" % (self.user.first_name, self.user.last_name)


    def save(self, *args, **kwargs):
        super(Profile, self).save(*args, **kwargs)
        img = Image.open(self.image.path)

        if img.height > 300 or img.width > 300:
            output_size = (300, 300)
            img.thumbnail(output_size)
            img.save(self.image.path)


class Subject(models.Model):
    name = models.CharField(max_length=50, primary_key=True)


class Known_subject(Subject): #removed subject as primary key?
    subject = models.OneToOneField(Subject, parent_link=True, on_delete="CASCADE")
    tutor = models.ManyToManyField(Profile)
    knowledge_level = models.CharField(max_length=50)
    school = models.CharField(max_length=100)
    graduation_year = models.IntegerField(validators=[MaxValueValidator(2050), MinValueValidator(1900)])
    gpa = models.FloatField(validators=[MaxValueValidator(0), MinValueValidator(5.0)])


class Specialty_Subject(Subject):
    subject = models.OneToOneField(Subject, parent_link=True, on_delete="CASCADE", primary_key=True)
    speciality = models.CharField(max_length=50)

class Tutor_Verification(models.Model):
    tutor = models.OneToOneField(Profile, primary_key=True, on_delete="CASCADE")
    verification = models.CharField(max_length=100)

class Dependent(models.Model):
    parent = models.OneToOneField(Profile, primary_key=True, on_delete="CASCADE")
    first_name = models.CharField(max_length=50)
    middle_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
#
# class Tutor_Teach_Student(models.Model): #not sure if this table is correct
#     tutor = models.OneToOneField(Profile, to_field='email', on_delete="CASCADE", related_name='tutor')
#     student = models.OneToOneField(Profile, to_field='email', on_delete="CASCADE", related_name='student')









#post_save.connect(create_Profile,sender=Profile)


# gotta do manage.py makemigrations to create the new models
# then do manage.py migrate to implement them to server
