# Generated by Django 2.1.7 on 2019-06-25 18:16

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import djrichtextfield.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Equip',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(max_length=255)),
                ('descripcio', djrichtextfield.models.RichTextField()),
            ],
        ),
        migrations.CreateModel(
            name='ModulProfessional',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.IntegerField(default=0)),
                ('nom', models.CharField(max_length=255)),
                ('descripcio', djrichtextfield.models.RichTextField()),
                ('cicle', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='core.Cicle')),
            ],
        ),
        migrations.CreateModel(
            name='Projecte',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(max_length=255)),
                ('descripcio', djrichtextfield.models.RichTextField()),
                ('inici', models.DateTimeField(auto_now_add=True)),
                ('final', models.DateTimeField()),
                ('admins', models.ManyToManyField(to=settings.AUTH_USER_MODEL)),
                ('centre', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.Centre')),
            ],
        ),
        migrations.CreateModel(
            name='Spec',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(max_length=255)),
                ('descripcio', djrichtextfield.models.RichTextField()),
                ('ordre', models.IntegerField(default=0)),
                ('pare', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='scrum.Spec')),
                ('projecte', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='scrum.Projecte')),
            ],
        ),
        migrations.CreateModel(
            name='Sprint',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(max_length=255)),
                ('notes', djrichtextfield.models.RichTextField()),
                ('ordre', models.IntegerField(default=0)),
                ('projecte', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='scrum.Projecte')),
            ],
        ),
        migrations.CreateModel(
            name='UnitatFormativa',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.IntegerField(default=0)),
                ('nom', models.CharField(max_length=255)),
                ('descripcio', djrichtextfield.models.RichTextField()),
                ('mp', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='scrum.ModulProfessional')),
            ],
        ),
        migrations.AddField(
            model_name='equip',
            name='projecte',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='scrum.Projecte'),
        ),
    ]
