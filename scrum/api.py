from django.http import HttpResponse
from django.contrib.auth.decorators import login_required, user_passes_test
from django.http import JsonResponse
from rest_framework import serializers

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
        for spec in sprint.specs.all():
            done_spec = DoneSpec(qualificacio=quali,spec=spec,done=False)
            done_spec.save()
        # TODO: actualitzar doneSpecs
    return JsonResponse({"status":"OK"})



class MpSerializer(serializers.ModelSerializer):
    class Meta:
        model = ModulProfessional
        fields = ['id','nom']
class SpecSerializer(serializers.ModelSerializer):
    mp = MpSerializer(many=True,read_only=True)
    class Meta:
        model = Spec
        fields = ['id','ordre','nom','descripcio','mp']
class DoneSpecSerializer(serializers.ModelSerializer):
    spec = SpecSerializer(read_only=True)
    class Meta:
        model = DoneSpec
        fields = ['id','done','spec',]

@login_required
def get_done_specs(request,qualificacio_id):
    quali_qs = Qualificacio.objects.filter(id=qualificacio_id,
                sprint__projecte__admins__in=[request.user])
    if not quali_qs:
        return JsonResponse({
            "status":"ERROR",
            "message":"ERROR accedint a la qualificacio."})
    qualificacio = quali_qs.first()
    donespecs_serializer = DoneSpecSerializer(qualificacio.done_specs,many=True)
    return JsonResponse({
        "status":"OK",
        "done_specs":donespecs_serializer.data,
        })

