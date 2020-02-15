from django.shortcuts import render


from scrum.models import Projecte

# Create your views here.


def index(request):
	projectes = Projecte.objects.all()
	return render( request, "projecte_list.html", {"projectes":projectes} )

def projecte(request,id):
	projecte = Projecte.objects.get(id=id)
	return render( request, "projecte.html", {"projecte":projecte} )

