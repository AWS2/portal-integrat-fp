from django.core.management.base import BaseCommand, CommandError
from borsApp.models import Cicle, Categoria

import csv

class Command(BaseCommand):
    help = 'Carrega dades dels centres docents'

    def handle(self, *args, **options):
        with open('misc/Directori_de_centres_docents.csv') as csvfile:
            csv_reader = csv.DictReader( csvfile )
            for row in csv_reader:
                print(row["Codi centre"]+" | "+row["Denominació completa"])
