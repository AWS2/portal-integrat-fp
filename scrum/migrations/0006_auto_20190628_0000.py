# Generated by Django 2.1.7 on 2019-06-28 00:00

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('scrum', '0005_auto_20190626_2132'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='modulprofessional',
            name='cicle',
        ),
        migrations.RemoveField(
            model_name='unitatformativa',
            name='mp',
        ),
        migrations.AlterField(
            model_name='projecte',
            name='inici',
            field=models.DateField(default=datetime.datetime.now),
        ),
        migrations.AlterField(
            model_name='spec',
            name='mp',
            field=models.ManyToManyField(blank=True, help_text='Mòdul Professional', to='core.ModulProfessional'),
        ),
        migrations.AlterField(
            model_name='sprint',
            name='final',
            field=models.DateField(),
        ),
        migrations.DeleteModel(
            name='ModulProfessional',
        ),
        migrations.DeleteModel(
            name='UnitatFormativa',
        ),
    ]