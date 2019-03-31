from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save

# Create your models here.
class UserProfile(models.Model):
    user = models.OneToOneField(User,on_delete="CASCADE")
    description = models.CharField(max_length=100,default='')
    city = models.CharField(max_length=100,default='')

def createProfile(sender,**kwargs):
    if kwargs['created']:
        user_profile = UserProfile.objects.create(user=kwargs['instance'])

post_save.connect(createProfile,sender=User)


# gotta do manage.py makemigrations to create the new models
# then do manage.py migrate to implement them to server
