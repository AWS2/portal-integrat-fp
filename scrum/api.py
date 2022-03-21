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
    if request.user.is_superuser:
        projecte = Projecte.objects.filter(id=sprint.projecte.id)
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
        fields = ['id','ordre','nom','descripcio','mp','hores_estimades']
class DoneSpecSerializer(serializers.ModelSerializer):
    spec = SpecSerializer(read_only=True)
    class Meta:
        model = DoneSpec
        fields = ['id','done','spec','ordre']
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username','first_name','last_name','email']
class EquipSerializer(serializers.ModelSerializer):
    membres = UserSerializer(many=True,read_only=True)
    class Meta:
        model = Equip
        fields = '__all__'
class QualiSerializer(serializers.ModelSerializer):
    done_specs = DoneSpecSerializer(many=True,read_only=True)
    equip = EquipSerializer(read_only=True)
    class Meta:
        model = Qualificacio
        fields = ['id','done_specs','equip','nota','comentaris',]

@login_required
def get_done_specs(request,qualificacio_id):
    quali_qs = Qualificacio.objects.filter(id=qualificacio_id,
                sprint__projecte__admins__in=[request.user])
    if request.user.is_superuser:
        quali_qs = Qualificacio.objects.filter(id=qualificacio_id)
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

@login_required
def get_qualificacio(request,qualificacio_id):
    quali_qs = Qualificacio.objects.filter(id=qualificacio_id,
                sprint__projecte__admins__in=[request.user])
    if request.user.is_superuser:
        quali_qs = Qualificacio.objects.filter(id=qualificacio_id)
    if not quali_qs:
        return JsonResponse({
            "status":"ERROR",
            "message":"ERROR accedint a la qualificacio."})
    qualificacio = quali_qs.first()
    qualiserializer = QualiSerializer(qualificacio)
    return JsonResponse({
        "status":"OK",
        "qualificacio":qualiserializer.data,
        })

@login_required
def elimina_qualificacio(request,qualificacio_id):
    quali_qs = Qualificacio.objects.filter(id=qualificacio_id,
                sprint__projecte__admins__in=[request.user])
    if request.user.is_superuser:
        quali_qs = Qualificacio.objects.filter(id=qualificacio_id)
    if not quali_qs:
        return JsonResponse({
            "status":"ERROR",
            "message":"ERROR accedint a la qualificacio."})
    qualificacio = quali_qs.first()
    qualificacio.delete()
    return JsonResponse({
        "status":"OK",
        "message":"Qualificació id={} eliminada.".format(qualificacio_id),
        })

@login_required
def toggle_done_spec(request,done_spec_id):
    done_spec_qs = DoneSpec.objects.filter(id=done_spec_id,
                spec__projecte__admins__in=[request.user])
    if request.user.is_superuser:
        done_spec_qs = DoneSpec.objects.filter(id=done_spec_id)
    if not done_spec_qs:
        return JsonResponse({
            "status":"ERROR",
            "message":"ERROR accedint a la spec a qualificar."})

    done_spec = done_spec_qs.first()
    done_spec.done = not done_spec.done
    done_spec.save()
    serializer = DoneSpecSerializer(done_spec)
    return JsonResponse({
        "status":"OK",
        "done_spec":serializer.data,
        })

@login_required
def set_comment_to_qualificacio(request,qualificacio_id):
    quali_qs = Qualificacio.objects.filter(id=qualificacio_id,
                sprint__projecte__admins__in=[request.user])
    if request.user.is_superuser:
        quali_qs = Qualificacio.objects.filter(id=qualificacio_id)
    if not quali_qs:
        return JsonResponse({
            "status":"ERROR",
            "message":"ERROR accedint a la qualificacio."})
    # guardem comentaris enviats
    comentaris = request.GET["comentaris"]
    qualificacio = quali_qs.first()
    qualificacio.comentaris = comentaris
    qualificacio.save()
    return JsonResponse({
        "status":"OK",
        "message":"Afegit comentari a la qualificació id={}.".format(qualificacio_id),
        })

