from django.core.management.base import BaseCommand, CommandError
from django.core.mail import send_mail
from django.conf import settings
from borsApp.models import *

class Command(BaseCommand):

    def handle(self, *args, **options):
        subject = 'Hola esto es una prueba para la demo'
        message = 'No respondas a este correo'
        email_from = settings.EMAIL_HOST_USER
        recipient_list = ['rgarciapaules@iesesteveterradas.cat',]

        send_mail( subject, message, email_from, recipient_list )