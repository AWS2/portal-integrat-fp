from django.shortcuts import render, redirect
from django.contrib.auth import logout
from django.shortcuts import redirect
from django import forms
from django.contrib.auth.decorators import login_required, user_passes_test
from django.utils import timezone

from core.models import *

# Create your views here.

def accepta_tos(func):
	def wrapper(request):
		if request.user.tos:
			func(request)
		else:
			return render( request, 'tos.html', {} )
	return wrapper
    
def login(request):
	return render( request, 'login.html', {} )

def logout_view(request):
	logout(request)
	return redirect("/")

@accepta_tos
def index(request):
	return render( request, 'index.html', {} )

#
# TOS (Termes d'ús)
##########################################
@login_required
def tos(request):
	return render( request, 'tos.html', {} )

@login_required
def tos_accepta(request):
	# guardem que l'usuari ha validat les condicions d'ús
	request.user.tos = True
	request.user.save()
	return render( request, 'index.html', {} )

@login_required
def tos_refusa(request):
	# Deixem constància del refús
	request.user.descripcio += "<p>L'usuari ha refusat els termes d'ús el {}</p>".format(timezone.now())
	request.user.save()
	logout(request)
	return render( request, 'index.html', {} )


#
# VIEWS
##########################################

class PerfilForm(forms.ModelForm):
	class Meta:
		model = User
		#exclude = ('groups','permissions','is_staff','is_superuser','is_active',
		#	'password','last_login','date_joined')
		fields = ['first_name','last_name','username','email',
			'imatge','arxiu','descripcio',]

@login_required
def perfil(request):
	print("ID user="+str(request.user.id))
	form = None
	if request.method=="POST":
		form = PerfilForm( request.POST, request.FILES, instance=request.user)
		if form.is_valid():
			# TODO: flash message?
			form.save()
			return redirect("/")
	else:
		# GET: create form
		form = PerfilForm(instance=request.user)
	
	return render(request, 'perfil.html', {"form":form} )
