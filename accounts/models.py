from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.core.validators import MinValueValidator, MaxValueValidator
from PIL import Image
from django.urls import reverse
#from djmoney.models.fields import MoneyField


class Subject(models.Model):
    name = models.CharField(max_length=50, primary_key=True)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('subject-choose', kwargs={'pk': self.pk})


kl_choices = (('Basic', 'Basic'),('Intermediate', 'Intermediate'),
              ('Advanced', 'Advanced'), ('Expert', 'Expert'), ('God', 'God'),)


class Known_subject(models.Model): #removed subject as primary key?
    id = models.AutoField(primary_key=True)
    subject = models.ForeignKey(Subject, on_delete="CASCADE")
    subject_creator = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    knowledge_level = models.CharField(max_length=50, choices=kl_choices)
    school = models.CharField(max_length=100)
    graduation_year = models.IntegerField(validators=[MinValueValidator(1900), MaxValueValidator(2050)],
                                          blank=True, null=True)
    gpa = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(5.0)], blank=True, null=True)
    specialty = models.CharField(max_length=50, default="", blank=True, null=True)

    def __str__(self):
        return "%s %s" % (self.subject, self.knowledge_level)


class Profile(models.Model):
    user = models.OneToOneField(User,on_delete="CASCADE")
    description = models.CharField(max_length=100, null=True)
    city = models.CharField(max_length=100,default='')
    image = models.ImageField(default='default.jpg', upload_to='profile_pics')
    education_level = models.CharField(max_length=100, default='')
    student_flag = models.BooleanField(default=False)
    tutor_flag = models.BooleanField(default=False)
    rate = models.FloatField(null=True)
    subjects = models.ForeignKey(Known_subject, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return "%s %s" % (self.user.first_name, self.user.last_name)

    def save(self, *args, **kwargs):
        super(Profile, self).save(*args, **kwargs)
        img = Image.open(self.image.path)

        if img.height > 100 or img.width > 100:
            output_size = (100, 100)
            img.thumbnail(output_size)
            img.save(self.image.path)

    def get_absolute_url(self):
        return reverse('book-detail', kwargs={'pk': self.pk})


class Tutor_Verification(models.Model):
    tutor = models.OneToOneField(Profile, primary_key=True, on_delete=models.CASCADE)
    verification = models.BooleanField(default=False)


class Dependent(models.Model):
    parent = models.OneToOneField(Profile, primary_key=True, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=50)
    middle_name = models.CharField(max_length=50, null=True)
    last_name = models.CharField(max_length=50)
#
# class Tutor_Teach_Student(models.Model): #not sure if this table is correct
#     tutor = models.OneToOneField(Profile, to_field='email', on_delete=models.CASCADE, related_name='tutor')
#     student = models.OneToOneField(Profile, to_field='email', on_delete=models.CASCADE, related_name='student')









#post_save.connect(create_Profile,sender=Profile)


# gotta do manage.py makemigrations to create the new models
# then do manage.py migrate to implement them to server
