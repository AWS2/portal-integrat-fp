from django.core.management.base import BaseCommand, CommandError
from core.models import *

import csv

class Command(BaseCommand):
    help = 'Carrega dades dels cicles formatius'
    CAT_CICLES = "Cicles Formatius de Formació Professional"
    cicles = {}
    families = {}
    cats = {}

    def handle(self, *args, **options):
        # categoria arrel
        arrel = None
        qs = Categoria.objects.filter(nom=self.CAT_CICLES)
        if not len(qs):
            arrel = Categoria(nom=self.CAT_CICLES)
            arrel.save()
        else:
            arrel = qs[0]

        # obrim arxiu
        with open('misc/Taules_cataleg_FP_18-19-LOE.csv') as csvfile:
            csv_reader = csv.DictReader( csvfile )
            cats = 0
            cicles = 0
            mps = 0
            ufs = 0
            for row in csv_reader:
                fam = row["CODI_CICLE_FORMATIU"][-4:-2]
                codi_cicle = row["CODI_CICLE_FORMATIU"][-4:]
                nom_cicle = row["NOM_CICLE_FORMATIU"]
                codi_mp = row["CODI_MODUL"]
                nom_mp = row["NOM_MODUL"]
                codi_uf = row["CODI_UNITAT_FORMATIVA"]
                nom_uf = row["NOM_UNITAT_FORMATIVA"]

                # creem objectes necessaris
                cat = Categoria.objects.filter(nom=fam).first()
                if not cat:
                    cat = Categoria()
                    cat.nom = fam
                    cat.pare = arrel
                    cat.save()
                    cats += 1

                cicle = Cicle.objects.filter(codi=codi_cicle).first()
                if not cicle:
                    cicle = Cicle()
                    cicle.codi = codi_cicle
                    cicle.nom = nom_cicle
                    cicle.familia = cat
                    cicle.descripcio = cicle.nom
                    cicle.save()
                    cicles += 1
                    #print(cicle.nom)
                
                mp = ModulProfessional.objects.filter(nom=nom_mp).first()
                if not mp:
                    mp = ModulProfessional()
                    mp.nom = nom_mp
                    mp.cicle = cicle
                    mp.numero = 0
                    mp.descripcio = ""
                    mp.save()
                    mps += 1
                    #print(mp.nom)

                """uf = UnitatFormativa.objects.filter(nom=nom_uf).first()
                if not uf:
                    uf = UnitatFormativa()
                    uf.numero = 0
                    uf.nom = nom_uf
                    uf.mp = mp
                    uf.descripcio = ""
                    uf.save()
                    ufs += 1
                    #print(uf.nom)
                """
            # sumari addicions
            print("TOTAL:\n\tCategories: {}\n\tCicles: {}\n\tMPs: {}\n\tUFs: {}".format(cats,cicles,mps,ufs))

