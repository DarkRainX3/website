# Generated by Django 2.1.7 on 2019-04-07 03:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0006_auto_20190406_0004'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='booking',
            name='meeting_place_id',
        ),
        migrations.RemoveField(
            model_name='booking',
            name='student_email',
        ),
        migrations.RemoveField(
            model_name='booking',
            name='tutor_email',
        ),
        migrations.DeleteModel(
            name='Booking_Message_Logs',
        ),
        migrations.DeleteModel(
            name='Booking_Offer',
        ),
        migrations.RemoveField(
            model_name='desired_meeting_place',
            name='meeting_ptr',
        ),
        migrations.RemoveField(
            model_name='invoice',
            name='booking_id',
        ),
        migrations.DeleteModel(
            name='Message',
        ),
        migrations.RemoveField(
            model_name='review',
            name='invoice_id',
        ),
        migrations.RemoveField(
            model_name='review',
            name='reviewee',
        ),
        migrations.RemoveField(
            model_name='review',
            name='reviewer',
        ),
        migrations.DeleteModel(
            name='Schedule',
        ),
        migrations.RemoveField(
            model_name='scheduled_booking',
            name='booking_ptr',
        ),
        migrations.DeleteModel(
            name='Booking',
        ),
        migrations.DeleteModel(
            name='Desired_Meeting_Place',
        ),
        migrations.DeleteModel(
            name='Invoice',
        ),
        migrations.DeleteModel(
            name='Meeting',
        ),
        migrations.DeleteModel(
            name='Meeting_Place',
        ),
        migrations.DeleteModel(
            name='Review',
        ),
        migrations.DeleteModel(
            name='Scheduled_Booking',
        ),
    ]
