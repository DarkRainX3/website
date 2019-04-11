# Generated by Django 2.2 on 2019-04-11 18:14

from django.conf import settings
import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Known_subject',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('knowledge_level', models.CharField(choices=[('Basic', 'Basic'), ('Intermediate', 'Intermediate'), ('Advanced', 'Advanced'), ('Expert', 'Expert'), ('God', 'God')], max_length=50)),
                ('school', models.CharField(max_length=100)),
                ('graduation_year', models.IntegerField(blank=True, null=True, validators=[django.core.validators.MinValueValidator(1900), django.core.validators.MaxValueValidator(2050)])),
                ('gpa', models.FloatField(blank=True, null=True, validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(5.0)])),
                ('specialty', models.CharField(blank=True, default='', max_length=50, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=100, null=True)),
                ('city', models.CharField(default='', max_length=100)),
                ('image', models.ImageField(default='default.jpg', upload_to='profile_pics')),
                ('education_level', models.CharField(default='', max_length=100)),
                ('student_flag', models.BooleanField(default=False)),
                ('tutor_flag', models.BooleanField(default=False)),
                ('rate', models.FloatField(null=True)),
                ('subjects', models.ForeignKey(null=True, on_delete='CASCADE', to='accounts.Known_subject')),
                ('user', models.OneToOneField(on_delete='CASCADE', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Subject',
            fields=[
                ('name', models.CharField(max_length=50, primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='Dependent',
            fields=[
                ('parent', models.OneToOneField(on_delete='CASCADE', primary_key=True, serialize=False, to='accounts.Profile')),
                ('first_name', models.CharField(max_length=50)),
                ('middle_name', models.CharField(max_length=50, null=True)),
                ('last_name', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Tutor_Verification',
            fields=[
                ('tutor', models.OneToOneField(on_delete='CASCADE', primary_key=True, serialize=False, to='accounts.Profile')),
                ('verification', models.BooleanField(default=False)),
            ],
        ),
        migrations.AddField(
            model_name='known_subject',
            name='subject',
            field=models.ForeignKey(on_delete='CASCADE', to='accounts.Subject'),
        ),
        migrations.AddField(
            model_name='known_subject',
            name='subject_creator',
            field=models.ForeignKey(null=True, on_delete='CASCADE', to=settings.AUTH_USER_MODEL),
        ),
    ]
