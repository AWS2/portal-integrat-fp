# Generated by Django 2.1.7 on 2019-04-09 17:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('borsApp', '0003_auto_20190409_1914'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='imatge',
            field=models.ImageField(blank=True, upload_to='imatgesPerfil'),
        ),
    ]
