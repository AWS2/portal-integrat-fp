# Generated by Django 2.2.4 on 2019-09-21 17:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_user_tos'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='data_notificacio_tos',
            field=models.DateTimeField(blank=True, default=None, null=True),
        ),
    ]
