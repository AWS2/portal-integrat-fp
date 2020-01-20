# Generated by Django 2.2.4 on 2020-01-20 14:41

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
import djrichtextfield.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('core', '0005_user_registre'),
        ('borsApp', '0003_oferta_categories'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='DemandaDual',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('inici', models.DateTimeField(default=django.utils.timezone.now)),
                ('final', models.DateTimeField()),
                ('activa', models.BooleanField(default=True)),
                ('titol', models.CharField(max_length=255)),
                ('descripcio', djrichtextfield.models.RichTextField()),
                ('categories', models.ManyToManyField(blank=True, to='core.Categoria')),
                ('centres', models.ManyToManyField(to='core.Centre')),
                ('cicles', models.ManyToManyField(to='core.Cicle')),
                ('creador', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
                ('empresa', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='borsApp.Empresa')),
            ],
            options={
                'verbose_name_plural': 'DemanadesDual',
            },
        ),
    ]