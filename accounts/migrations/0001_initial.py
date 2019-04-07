# Generated by Django 2.1.7 on 2019-04-07 06:12

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
            name='Profile',
            fields=[
                ('email', models.EmailField(default='', max_length=254, primary_key=True, serialize=False, unique=True)),
                ('description', models.CharField(max_length=100, null=True)),
                ('city', models.CharField(default='', max_length=100)),
                ('image', models.ImageField(default='default.jpg', upload_to='profile_pics')),
                ('education_level', models.CharField(default='', max_length=100)),
                ('student_flag', models.BooleanField(default=False)),
                ('tutor_flag', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Subject',
            fields=[
                ('name', models.CharField(max_length=50, primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='Tutor_Teach_Student',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='Dependent',
            fields=[
                ('parent_email', models.OneToOneField(on_delete='CASCADE', primary_key=True, serialize=False, to='accounts.Profile')),
                ('first_name', models.CharField(max_length=50)),
                ('middle_name', models.CharField(max_length=50)),
                ('last_name', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Known_subject',
            fields=[
                ('subject', models.OneToOneField(on_delete='CASCADE', parent_link=True, primary_key=True, serialize=False, to='accounts.Subject')),
                ('knowledge_level', models.CharField(max_length=50)),
                ('school', models.CharField(max_length=100)),
                ('graduation_year', models.IntegerField(validators=[django.core.validators.MaxValueValidator(2050), django.core.validators.MinValueValidator(1900)])),
                ('gpa', models.FloatField(validators=[django.core.validators.MaxValueValidator(0), django.core.validators.MinValueValidator(5.0)])),
            ],
            bases=('accounts.subject',),
        ),
        migrations.CreateModel(
            name='Specialty_Subject',
            fields=[
                ('subject', models.OneToOneField(on_delete='CASCADE', parent_link=True, primary_key=True, serialize=False, to='accounts.Subject')),
                ('speciality', models.CharField(max_length=50)),
            ],
            bases=('accounts.subject',),
        ),
        migrations.CreateModel(
            name='Tutor_Verification',
            fields=[
                ('email', models.OneToOneField(on_delete='CASCADE', primary_key=True, serialize=False, to='accounts.Profile')),
                ('verification', models.CharField(max_length=100)),
            ],
        ),
        migrations.AddField(
            model_name='tutor_teach_student',
            name='student',
            field=models.OneToOneField(on_delete='CASCADE', related_name='student', to='accounts.Profile'),
        ),
        migrations.AddField(
            model_name='tutor_teach_student',
            name='tutor',
            field=models.OneToOneField(on_delete='CASCADE', related_name='tutor', to='accounts.Profile'),
        ),
        migrations.AddField(
            model_name='profile',
            name='user',
            field=models.OneToOneField(on_delete='CASCADE', related_name='profile', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='known_subject',
            name='tutor',
            field=models.ManyToManyField(to='accounts.Profile'),
        ),
    ]
