# Generated by Django 2.2 on 2019-04-06 00:54

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0003_auto_20190405_1803'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='profile',
            name='id',
        ),
        migrations.AddField(
            model_name='profile',
            name='education_level',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AddField(
            model_name='profile',
            name='email',
            field=models.EmailField(default='', max_length=254, primary_key=True, serialize=False, unique=True),
        ),
        migrations.AddField(
            model_name='profile',
            name='student_flag',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='profile',
            name='tutor_flag',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='booking',
            name='student_email',
            field=models.ForeignKey(on_delete=models.SET('email'), related_name='student_email', to='accounts.Profile'),
        ),
        migrations.AlterField(
            model_name='booking',
            name='tutor_email',
            field=models.ForeignKey(on_delete=models.SET('email'), to='accounts.Profile'),
        ),
        migrations.AlterField(
            model_name='dependent',
            name='parent_email',
            field=models.OneToOneField(on_delete='CASCADE', primary_key=True, serialize=False, to='accounts.Profile'),
        ),
        migrations.AlterField(
            model_name='known_subject',
            name='tutor',
            field=models.ManyToManyField(to='accounts.Profile'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='user',
            field=models.OneToOneField(on_delete='CASCADE', related_name='profile', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='review',
            name='reviewee',
            field=models.OneToOneField(on_delete='CASCADE', related_name='reviewee', to='accounts.Profile'),
        ),
        migrations.AlterField(
            model_name='review',
            name='reviewer',
            field=models.OneToOneField(on_delete='CASCADE', related_name='reviewer', to='accounts.Profile'),
        ),
        migrations.AlterField(
            model_name='tutor_teach_student',
            name='student',
            field=models.OneToOneField(on_delete='CASCADE', related_name='student', to='accounts.Profile'),
        ),
        migrations.AlterField(
            model_name='tutor_teach_student',
            name='tutor',
            field=models.OneToOneField(on_delete='CASCADE', related_name='tutor', to='accounts.Profile'),
        ),
        migrations.AlterField(
            model_name='tutor_verification',
            name='email',
            field=models.OneToOneField(on_delete='CASCADE', primary_key=True, serialize=False, to='accounts.Profile'),
        ),
        migrations.DeleteModel(
            name='User',
        ),
    ]
