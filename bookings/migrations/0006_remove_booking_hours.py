# Generated by Django 2.1.7 on 2019-04-12 08:32

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('bookings', '0005_auto_20190412_0148'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='booking',
            name='hours',
        ),
    ]