from django.core.management.base import BaseCommand, CommandError
from borsApp.models import Cicle, Categoria, Centre
from django.contrib.gis.geos import Point

from scrum.models import *

class Command(BaseCommand):
    help = 'Clona projecte'

    def handle(self, *args, **options):
        projecte = Projecte.objects.get(nom='TPV "Bar Reynolds"')
        print(projecte)

        """print("______________________EQUIPS______________________")
        for equip in projecte.equips.all():
            print(equip)
        """

        print("______________________SPECS______________________")
        specs = list(projecte.spec_set.all())

        projecte.id = None
        projecte.nom = "TPV 2"
        projecte.save()

        for spec in specs:
            spec.id = None
            spec.projecte = projecte
            spec.save()




