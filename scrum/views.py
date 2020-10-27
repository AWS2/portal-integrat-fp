from django.shortcuts import render


from scrum.models import Projecte
from core.models import ModulProfessional

# Create your views here.


def index(request):
	projectes = Projecte.objects.order_by('-inici')
	return render( request, "projecte_list.html", {"projectes":projectes} )

def projecte(request,id):
	projecte = Projecte.objects.get(id=id)
	mps = ModulProfessional.objects.filter( specs__projecte=projecte ).distinct()
	return render( request, "projecte.html", {"projecte":projecte,"mps":mps} )

