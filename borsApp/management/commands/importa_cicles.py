from django.core.management.base import BaseCommand, CommandError
from borsApp.models import Cicle, Categoria

import csv

class Command(BaseCommand):
    help = 'Carrega dades dels cicles formatius'

    def handle(self, *args, **options):
    	print("hola")
    	"""with open('misc/Taules_cataleg_FP_18-19-LOE.csv') as csvfile:
    		csv_reader = csvfile"""
