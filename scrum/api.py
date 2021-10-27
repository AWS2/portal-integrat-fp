from django.http import HttpResponse
from django.contrib.auth.decorators import login_required, user_passes_test
from django.http import JsonResponse

from scrum.models import *



@login_required
def crea_qualificacio(request,sprint_id,equip_id):
	sprint_query = Sprint.objects.filter(id=sprint_id)
	if not sprint:
	    return JsonResponse({
	    	"status":"ERROR",
	    	"message":"Unknown sprint_id.",
	    })
	projecte = Projecte.objects.filter(id=sprint.projecte.id,
								admins_in=[request.user])
	if not projecte:
	    return JsonResponse({
	    	"status":"ERROR",
	    	"message":"Falta de permisos.",
	    })
	equip = Equip.objects.filter(id=equip_id)
	quali = Qualificacio.objects.filter(projecte=Projecte,
						equip=equip,sprint=sprint)


	return JsonResponse({"status":"OK"})



@login_required
def qualifica_spec(request,projecte_id,equip_id):
    return JsonResponse({"status":"OK"})

