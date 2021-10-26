
# lib.py

from scrum.models import *

#
# Utils
##########################################
def actualitza_qualificacions():
    print("actualitzant...")
    sprints = Sprint.objects.all()
    for sprint in sprints:
        # cal crear una Qualificació per cada sprint i equip
        for equip in sprint.projecte.equips.all():
            quali = None
            qualis = Qualificacio.objects.filter(sprint=sprint,equip=equip)
            if not qualis:
                print("Creant Qualificacio per a "+sprint.nom)
                quali = Qualificacio(sprint=sprint,equip=equip)
                quali.save()
            else:
                quali = qualis[0]
            # cal crear un DoneSpec per cada Qualificació i Spec
            for spec in sprint.specs.all():
                dspecs = DoneSpec.objects.filter(qualificacio=quali,spec=spec)
                if not dspecs:
                    dspec = DoneSpec(qualificacio=quali,spec=spec)
                    dspec.save()
            # esborrar done_specs que s'hagin tret del sprint
            for dspec in quali.done_specs.all():
                if dspec.spec not in sprint.specs.all():
                    dspec.delete()


#
# API endpoints
##########################################
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required, user_passes_test
from django.http import JsonResponse


#@login_required
def api_actualitza_qualificacions(request):
    try:
        actualitza_qualificacions()
        return HttpResponse("OK")
    except e:
        return HttpResponse("ERROR")


from rest_framework import serializers

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['email','first_name','last_name']

class EquipSerializer(serializers.ModelSerializer):
    membres = UserSerializer(many=True,read_only=True)
    class Meta:
        model = Equip
        fields = ['id','nom','membres']

def api_get_equips(request):
    equips = Equip.objects.all()
    equipSerializer = EquipSerializer(equips,many=True)
    return JsonResponse({"equips":equipSerializer.data})


