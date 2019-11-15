from django.core.management.base import BaseCommand, CommandError
from django.core.mail import send_mail
from django.conf import settings
from django.contrib.auth.models import Group
from django.template.loader import render_to_string
from django.utils.html import strip_tags
from django.utils import timezone

from borsApp.models import *
from borsApp.views import filtra_ofertes_alumne


class Command(BaseCommand):
    """ EMAIL TOS
        Comanda per enviar emails pendents d'invitació als alumnes introduits
    """

    email_body ="""<p>Benvolguda/Benvolgut,</p>
<p>com a alumne o ex-alumne del centre {} has estat donat d'alta al Portal Integrat de FP, on podràs accedir a la borsa de treball.</p>
<p>Per poder fer ús dels serveis has d'entrar al portal https://borsa.ieti.cat i acceptar els termes d'ús.</p>
<p>Esperem que et siguin d'utilitat.</p>
<p>Atentament,</p>
<br>
<p>Equip Borsa de Treball IETI</p>
"""

    def add_arguments(self, parser):
        # args opcionals --all
        parser.add_argument('--all', action="store_true",
                help="Envia emails a tots els usuaris pendents de validar els TOS.")

    def handle(self, *args, **options):
        print("Enviant INVITACIONS d'alumnes al portal.")
        total = 0
        # iterem alumnes que encara no hagin acceptat el TOS i que 
        galumnes = Group.objects.get(name="alumnes")
        # queryset --all : tots els alumnes amb tos=False
        alumnes = User.objects.filter(groups__in=[galumnes,],tos=False)
        if not options["all"]:
            # si no hi ha arg --all , eliminem els actius i ja notificats
            alumnes = alumnes.filter(data_notificacio_tos=None,is_active=True)
        # iterem alumnes
        for alumne in alumnes:
            # debug
            print(alumne)
            # enviem email de benvinguda
            subject = "Portal integrat FP. Borsa de treball."
            email_from = settings.EMAIL_HOST_USER
            email_to = [ alumne.email, ]
            # afegim centre al redactat de l'email
            body = self.email_body.format(alumne.centre)
            plain_body = strip_tags(body)
            #print(body)
            enviat = True #send_mail( subject, plain_body, email_from, email_to, html_message=body )
            # si l'email s'envia correctament, es marquen totes les notificacions com OK
            if enviat:
                alumne.data_notificacio_tos = timezone.now()
                alumne.save()
                print("EMAIL enviat a "+str(alumne.email))
                total += 1
            else:
                print("ERROR a l'enviar email d'invitació ({})".format(email_to))

            # controlem MAX_EMAILS (per no ser classificats per spam)
            if total>settings.MAX_EMAILS:
                print("Arribat maxim nombre d'emails. Parem fins següent enviament.")
                break


