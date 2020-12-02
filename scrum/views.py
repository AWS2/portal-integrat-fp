from django.shortcuts import render

from scrum.models import Projecte, Spec, SpecFeedback
from core.models import ModulProfessional


# Create your views here.


def index(request):
	projectes = Projecte.objects.order_by('-inici')
	return render( request, "projecte_list.html", {"projectes":projectes} )

def projecte(request,id):
	projecte = Projecte.objects.get(id=id)
	mps = ModulProfessional.objects.filter(specs__projecte=projecte).distinct()
	toggled_comment = None
	if request.method=="POST":
		# processem comentaris enviats
		spec_id = request.POST.get("spec_id")
		sprint_id = request.POST.get("sprint_id")
		spec = Spec.objects.get(id=spec_id)
		comentari = SpecFeedback()
		comentari.spec = spec
		equips = request.user.equips.filter(membres__in=[request.user])
		comentari.equip = equips[0]
		comentari.usuari = request.user
		comentari.hores = request.POST.get("hores")
		comentari.desc = request.POST.get("desc").strip()
		comentari.save()
		toggled_comment = {"sprint_id":sprint_id,"spec_id":spec_id}
	return render( request, "projecte.html", {"projecte":projecte,
					"mps":mps, "toggled_comment":toggled_comment} )

