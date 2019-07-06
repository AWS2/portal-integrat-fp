from django.shortcuts import render
from django.contrib.auth import logout
from django.shortcuts import redirect

# Create your views here.

from borsApp.views import es_admin_centre_educatiu

    
def login(request):
	return render(request, 'core/login.html', {} )

def logout_view(request):
	logout(request)
	return redirect("/")

def index(request):
	return render(request, 'core/index.html', 
		{"es_admin_centre_educatiu":es_admin_centre_educatiu(request.user)} )

