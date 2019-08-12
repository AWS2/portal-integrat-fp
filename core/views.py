from django.shortcuts import render, redirect
from django.contrib.auth import logout
from django.shortcuts import redirect
from django import forms
from django.contrib.auth.decorators import login_required, user_passes_test

from core.models import *

# Create your views here.

    
def login(request):
	return render(request, 'login.html', {} )

def logout_view(request):
	logout(request)
	return redirect("/")

def index(request):
	return render(request, 'index.html', {} )


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
