# Generated by Django 2.2.4 on 2020-10-06 07:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('scrum', '0008_merge_20191111_1313'),
    ]

    operations = [
        migrations.AlterField(
            model_name='spec',
            name='mp',
            field=models.ManyToManyField(blank=True, help_text="Mòduls Professionals. NOTA: no apareixeran a en la CREACIÓ de la Spec, sinó en l'EDICIÓ", related_name='specs', to='core.ModulProfessional'),
        ),
    ]
