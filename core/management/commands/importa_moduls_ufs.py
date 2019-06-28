
from django.core.management.base import BaseCommand, CommandError

from core.models import Cicle, Categoria

import csv

class Command(BaseCommand):
    help = 'Carrega dades del Mòduls Professionals i Unitats Formatives (MPs i UFs)'
    mps = {}
    ufs = {}
    cicles = {}

    def handle(self, *args, **options):
        cicles = {}
        with open('misc/mps_informatica.csv') as csvfile:
            csv_reader = csv.DictReader( csvfile, delimiter=";" )
            for row in csv_reader:
                if row["codi"]:
                    self.cicles[row["codi"]] = row["codi"]
        #debug
        self.show_cicles()

        self.carrega()

    def show_cicles(self):
        for codi in self.cicles:
            print(self.cicles[codi])

    def carrega(self):
        # reseteja DB
        ModulProfessional.objects.all().delete()
        UnitatFormativa.objects.all().delete()

        # carrega families (categories)
        for codi in self.families:
            cat = Categoria()
            cat.nom = self.families[codi]
            cat.pare = arrel
            cat.save()
            self.cats[codi] = cat
        # carrega cicles
        for codi in self.cicles:
            cicle = Cicle()
            grau = codi[:4]
            if grau=="CFPS":
                cicle.grau = "CFGS"
            else:
                cicle.grau = "CFGM"
            cicle.codi = codi[-4:]
            cicle.nom = self.cicles[codi]
            codifamilia = codi[-4:-2]
            cicle.familia = self.cats[codifamilia]
            cicle.descripcio = cicle.nom
            print(cicle.codi)
            cicle.save()

