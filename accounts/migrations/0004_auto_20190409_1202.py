# Generated by Django 2.2 on 2019-04-09 18:02

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0003_auto_20190409_1201'),
    ]

    operations = [
        migrations.AlterField(
            model_name='known_subject',
            name='gpa',
            field=models.FloatField(blank=True, null=True, validators=[django.core.validators.MaxValueValidator(0), django.core.validators.MinValueValidator(5.0)]),
        ),
        migrations.AlterField(
            model_name='known_subject',
            name='specialty',
            field=models.CharField(blank=True, default='', max_length=50, null=True),
        ),
    ]
