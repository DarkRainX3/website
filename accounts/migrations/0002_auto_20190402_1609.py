# Generated by Django 2.2 on 2019-04-02 22:09

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Booking',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('start_time', models.DateTimeField()),
                ('end_time', models.DateTimeField()),
                ('description', models.CharField(max_length=250)),
                ('booking_type', models.CharField(max_length=10)),
                ('pref_platform', models.CharField(max_length=50)),
                ('commute_fee', models.FloatField()),
            ],
        ),
        migrations.CreateModel(
            name='Booking_Message_Logs',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='Booking_Offer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='Invoice',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('amount', models.FloatField()),
                ('booking_id', models.OneToOneField(on_delete='CASCADE', to='accounts.Booking')),
            ],
        ),
        migrations.CreateModel(
            name='Meeting',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='Meeting_Place',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
                ('number', models.IntegerField()),
                ('street', models.CharField(max_length=100)),
                ('city', models.CharField(max_length=50)),
                ('postal_code', models.CharField(max_length=6)),
                ('is_private', models.BooleanField()),
            ],
        ),
        migrations.CreateModel(
            name='Message',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='Schedule',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='Subject',
            fields=[
                ('name', models.CharField(max_length=50, primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('email', models.CharField(max_length=100, primary_key=True, serialize=False, unique=True)),
                ('password', models.CharField(max_length=100)),
                ('birth_date', models.DateField(max_length=8)),
                ('education_level', models.CharField(default='', max_length=100)),
                ('first_name', models.CharField(max_length=50)),
                ('middle_name', models.CharField(max_length=50)),
                ('last_name', models.CharField(max_length=50)),
                ('student_flag', models.BooleanField()),
                ('tutor_flag', models.BooleanField()),
            ],
        ),
        migrations.CreateModel(
            name='Dependent',
            fields=[
                ('parent_email', models.OneToOneField(on_delete='CASCADE', primary_key=True, serialize=False, to='accounts.User')),
                ('first_name', models.CharField(max_length=50)),
                ('middle_name', models.CharField(max_length=50)),
                ('last_name', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Desired_Meeting_Place',
            fields=[
                ('meeting_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='accounts.Meeting')),
            ],
            bases=('accounts.meeting',),
        ),
        migrations.CreateModel(
            name='Scheduled_Booking',
            fields=[
                ('booking_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='accounts.Booking')),
            ],
            bases=('accounts.booking',),
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
                ('email', models.OneToOneField(on_delete='CASCADE', primary_key=True, serialize=False, to='accounts.User')),
                ('verification', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Tutor_Teach_Student',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('student', models.OneToOneField(on_delete='CASCADE', related_name='student', to='accounts.User')),
                ('tutor', models.OneToOneField(on_delete='CASCADE', related_name='tutor', to='accounts.User')),
            ],
        ),
        migrations.CreateModel(
            name='Review',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('overall_rating', models.IntegerField(validators=[django.core.validators.MaxValueValidator(0), django.core.validators.MinValueValidator(5)])),
                ('knowledge', models.CharField(max_length=100)),
                ('explanation', models.CharField(max_length=250)),
                ('invoice_id', models.OneToOneField(on_delete='CASCADE', to='accounts.Invoice')),
                ('reviewee', models.OneToOneField(on_delete='CASCADE', related_name='reviewee', to='accounts.User')),
                ('reviewer', models.OneToOneField(on_delete='CASCADE', related_name='reviewer', to='accounts.User')),
            ],
        ),
        migrations.AddField(
            model_name='booking',
            name='meeting_place_id',
            field=models.ForeignKey(on_delete='CASCADE', to='accounts.Meeting_Place'),
        ),
        migrations.AddField(
            model_name='booking',
            name='student_email',
            field=models.ForeignKey(on_delete=models.SET('email'), related_name='student_email', to='accounts.User'),
        ),
        migrations.AddField(
            model_name='booking',
            name='tutor_email',
            field=models.ForeignKey(on_delete=models.SET('email'), to='accounts.User'),
        ),
        migrations.CreateModel(
            name='Known_subject',
            fields=[
                ('subject', models.OneToOneField(on_delete='CASCADE', parent_link=True, primary_key=True, serialize=False, to='accounts.Subject')),
                ('knowledge_level', models.CharField(max_length=50)),
                ('school', models.CharField(max_length=100)),
                ('graduation_year', models.IntegerField(validators=[django.core.validators.MaxValueValidator(2050), django.core.validators.MinValueValidator(1900)])),
                ('gpa', models.FloatField(validators=[django.core.validators.MaxValueValidator(0), django.core.validators.MinValueValidator(5.0)])),
                ('tutor', models.ManyToManyField(to='accounts.User')),
            ],
            bases=('accounts.subject',),
        ),
    ]