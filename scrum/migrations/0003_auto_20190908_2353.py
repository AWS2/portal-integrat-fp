# Generated by Django 2.2.4 on 2019-09-08 23:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('scrum', '0002_spec_hores_estimades'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sprint',
            name='specs',
            field=models.ManyToManyField(blank=True, help_text="NOTA: no apareixeran a en la CREACIÓ del Sprint, sinó en l'EDICIÓ", related_name='sprints', to='scrum.Spec'),
        ),
    ]