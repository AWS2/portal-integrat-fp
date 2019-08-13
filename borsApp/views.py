from django.shortcuts import render
from django import forms
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.models import Group

from django_select2.forms import Select2Widget
from easy_select2 import Select2
# https://stackoverflow.com/questions/8022530/how-to-check-for-valid-email-address
from validate_email import validate_email
import re

from core.models import Centre, User, Cicle
from borsApp.models import Empresa, Titol, Oferta

from datetime import datetime
# Create your views here.



class ConvidaForm(forms.Form):
	centre = forms.ModelChoiceField( Centre.objects.none(), widget=Select2Widget )
	cicle = forms.ModelChoiceField( None, widget=Select2Widget )
	finalitzat = forms.BooleanField( required=False,
							help_text="Marcar si els alumnes ja han finalitzat el cicle." )
	#data_finalitzacio = forms.DateField( widget=forms.SelectDateWidget, required=False,
	#						help_text="Data de graduació de l'alumne")
	emails = forms.CharField( widget=forms.Textarea,
							help_text="Un email per línia dels alumnes a convidar.")


# Create your views here.
def index(request):
    return render(request, 'borsApp/index.html', {} )


def es_admin_centre( usuari ):
	return usuari.es_admin_centre


def filtra_ofertes_alumne(alumne):
	# TODO: resoldre per subscripcions
	# HO RESOLEM PELS TÍTOLS DE L'ALUMNE
    # cicles que ha cursat l'alumne
    cicles = [ titol.cicle for titol in alumne.titols.all() ]
    centres = [ titol.centre for titol in alumne.titols.all() ]
    # TODO:(revisar, eliminar) només de les empreses que estan adscrites al centre de l'alumne
    # TODO: distància en km...
    empreses = Empresa.objects.filter(adscripcio__in=centres)
    # qs final (ofertes)
    qs = Oferta.objects.filter(
                        cicles__in=cicles,           # cicles subscrits
                        activa=True,
                        empresa__in=empreses,        # empreses adscrites TODO: segur?/eliminar?
                        final__gte=datetime.today(), # eliminem les caducades
                    )
    return qs


@login_required
@user_passes_test( es_admin_centre, login_url="/login" )
def convida(request):
	if request.method=="POST":
		# dades form
		cicle = Cicle.objects.get(pk=request.POST["cicle"])
		centre = Centre.objects.get(pk=request.POST["centre"])
		finalitzat = False
		if request.POST.get("finalitzat",False):
			finalitzat = True
		# emails
		emails = request.POST["emails"].split("\n")
		emails_ok = []
		emails_repetits = []
		emails_erronis = []
		# grup alumnes
		galumnes = Group.objects.get(name="alumnes")
		for email in emails:
			email = email.strip()
			#print("("+email+")")
			# comprovar si repetit
			users = User.objects.filter(email=email)
			if not validate_email(email):
				emails_erronis.append(email)
			elif users:
				usuari = users[0]
				# no cal crear usuari
				emails_repetits.append(email)
				# creem titol si necessari
				if Titol.objects.filter(cicle=cicle,centre=centre,alumne=usuari).count()==0:
					titol = Titol( cicle=cicle, centre=centre, graduat=finalitzat, alumne=usuari )
					titol.save()
				# afegim al grup alumnes
				galumnes.user_set.add(usuari)
			elif validate_email(email,verify=True):
				# crear usuari (al grup alumnes)
				user = User(username=email.replace("@","_"),email=email,is_staff=True,centre=centre)
				user.save()
				emails_ok.append(email)
				# crear títol de l'alumne
				titol = Titol( cicle=cicle, centre=centre, graduat=finalitzat, alumne=user )
				titol.save()
				# afegir al grup alumnes
				galumnes.user_set.add(user)
			else:
				emails_erronis.append(email)
			# TODO: enviar email a l'alumne
		return render(request,'borsApp/convida.html',
			{	"cicle":cicle, "centre":centre,
				"emails_ok":emails_ok,
				"emails_repetits":emails_repetits,
				"emails_erronis":emails_erronis} )
	# GET: creem form per introduir emails d'invitació
	form = ConvidaForm(request.GET)
	if request.user.is_superuser:
		form.fields["centre"].queryset = Centre.objects.all()
		form.fields["cicle"].queryset = Cicle.objects.all()
	else:
		# només permet convidar als cicles gestionants pel 1r centre
		# TODO: filtrar correctament
		centres = request.user.centres_admin.all()
		form.fields["centre"].queryset = centres
		form.fields["cicle"].queryset = Cicle.objects.filter(centres__in=centres)
		#request.user.centres_admin.all().cicles.all()
	return render(request, 'borsApp/convida.html', {"form":form} )

@login_required
@user_passes_test( es_admin_centre, login_url="/login" )
def invitacions(request):
	return render(request, 'borsApp/invitacions.html')

