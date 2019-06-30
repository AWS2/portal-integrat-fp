# Generated by Django 2.1.7 on 2019-06-30 22:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('scrum', '0008_auto_20190630_2011'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='spec',
            options={'ordering': ['ordre']},
        ),
        migrations.RemoveField(
            model_name='sprint',
            name='ordre',
        ),
        migrations.AlterField(
            model_name='spec',
            name='mp',
            field=models.ManyToManyField(blank=True, help_text="Mòduls Professionals. NOTA: no apareixeran a en la CREACIÓ de la Spec, sinó en l'EDICIÓ", to='core.ModulProfessional'),
        ),
        migrations.AlterField(
            model_name='sprint',
            name='inici',
            field=models.DateField(),
        ),
        migrations.AlterField(
            model_name='sprint',
            name='specs',
            field=models.ManyToManyField(blank=True, help_text="NOTA: no apareixeran a en la CREACIÓ del Sprint, sinó en l'EDICIÓ", to='scrum.Spec'),
        ),
    ]