from django.core.management.base import BaseCommand, CommandError
from borsApp.models import Cicle, Categoria

import csv

class Command(BaseCommand):
    help = 'Carrega dades dels cicles formatius'

    cicles = {}

    def handle(self, *args, **options):
        cicles = {}
        with open('misc/Taules_cataleg_FP_18-19-LOE.csv') as csvfile:
            csv_reader = csv.DictReader( csvfile )
            for row in csv_reader:
                self.cicles[row["CODI_CICLE_FORMATIU"]] = row["NOM_CICLE_FORMATIU"]
        # mostrem cicles
        #self.show()

        Cicle.objects.all().delete()
        self.carrega()

    def show(self):
        for codi in self.cicles:
            print(self.cicles[codi])


    def carrega(self):
        for codi in self.cicles:
            cicle = Cicle()
            cicle.grau = "CFGS"
            cicle.codi = codi[-4:]
            cicle.nom = self.cicles[codi]
            cicle.familia = None
            cicle.descripcio = cicle.nom
            print(cicle.codi)
            cicle.save()

