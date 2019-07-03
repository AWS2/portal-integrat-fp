# Generated by Django 2.1.7 on 2019-07-02 23:35

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_auto_20190628_2157'),
    ]

    operations = [
        migrations.AlterField(
            model_name='centre',
            name='admins',
            field=models.ManyToManyField(blank=True, related_name='centres_admin', to=settings.AUTH_USER_MODEL),
        ),
    ]
