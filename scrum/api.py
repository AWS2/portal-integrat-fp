from django.http import HttpResponse
from django.contrib.auth.decorators import login_required, user_passes_test
from django.http import JsonResponse

from scrum.models import *



@login_required
def crea_qualificacio(request,sprint_id,equip_id):
	sprint_qs = Sprint.objects.filter(id=sprint_id)
	if not sprint_qs:
	    return JsonResponse({
	    	"status":"ERROR",
	    	"message":"Unknown sprint_id.",
	    })
	sprint = sprint_qs.first()
	projecte = Projecte.objects.filter(id=sprint.projecte.id,
								admins__in=[request.user])
	if not projecte:
	    return JsonResponse({
	    	"status":"ERROR",
	    	"message":"Falta de permisos.",
	    })
	equip_qs = Equip.objects.filter(id=equip_id)
	equip = equip_qs.first()
	quali_qs = Qualificacio.objects.filter(equip=equip,sprint=sprint)
	if not quali_qs:
		quali = Qualificacio(equip=equip,sprint=sprint)
		quali.save()
	return JsonResponse({"status":"OK"})


@login_required
def qualifica_spec(request,projecte_id,equip_id):
    return JsonResponse({"status":"OK"})

