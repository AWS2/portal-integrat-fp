from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.db.models import Sum

from scrum.models import *
from core.models import *


# Create your views here.


def llista_projectes(request):
    centres = Centre.objects.annotate(proj_count=Sum("projectes")).filter(proj_count__gt=0)
    cicles = Cicle.objects.annotate(proj_count=Sum("projectes")).filter(proj_count__gt=0)
    projectes = Projecte.objects.order_by('-inici')
    centre_id = request.GET.get("centre_id")
    cicle_id = request.GET.get("cicle_id")
    if centre_id and centre_id.isnumeric() and centre_id!="0":
        projectes = projectes.filter(centre__id=centre_id)
    if cicle_id and cicle_id.isnumeric() and cicle_id!="0":
        projectes = projectes.filter(cicle__id=cicle_id)
    if cicle_id.isnumeric():
        cicle_id = int(cicle_id)
    if centre_id.isnumeric():
        centre_id = int(centre_id)
    return render( request, "projecte_list.html", {"projectes":projectes, "centres":centres,
                    "cicles":cicles, "centre_id":centre_id, "cicle_id":cicle_id } )


def projecte(request,id):
    projecte = Projecte.objects.get(id=id)
    mps = projecte.mps()
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
    # activem comentaris nomes si l'usuari està en algun grup de treball
    activa_comentaris = False
    if not request.user.is_anonymous:
        if request.user.is_superuser or request.user.es_profe:
            activa_comentaris = True
        equips = request.user.equips.filter(membres__in=[request.user])
        if len(equips)>0:
            activa_comentaris = True
    return render( request, "projecte.html", {"projecte":projecte,
                    "mps": mps, "toggled_comment": toggled_comment,
                    "activa_comentaris": activa_comentaris } )

@login_required
def qualifica(request):
    projectes = Projecte.objects.filter(admins__in=[request.user]).order_by('-inici')
    if request.user.is_superuser:
        projectes = Projecte.objects.order_by('-inici')
    if not request.GET.get("projecte_id") or not request.GET["projecte_id"].isdigit():
        # sense detalls de projecte
        return render( request, "qualifica.html", {"projectes":projectes} )
    # amb detalls
    projecte = Projecte.objects.get(id=request.GET["projecte_id"])
    return render( request, "qualifica.html", {
        "projectes":projectes,
        "projecte": projecte,
    } )

import os,tempfile, xlsxwriter
from django.conf import settings
from django.http import HttpResponse, Http404


@login_required
def descarrega_qualificacions(request,projecte_id):
    #try:
        # arxiu temporal per descàrrega
        file, path = tempfile.mkstemp()
        # TODO: filtrar segons si usuari es admin del projecte
        projectes = Projecte.objects.filter(id=projecte_id,admins__in=[request.user,])
        if not projectes:
            # problema de permisos
            raise Http404

        projecte = projectes.first()

        # creem arxiu de full de calcul
        workbook = xlsxwriter.Workbook(path)
        for mp in projecte.mps().all():
            codi = mp.nom[0:4]
            header = workbook.add_format({'bold': True,'bg_color':'black','font_color':'white'})
            header.set_text_wrap()
            percent_format = workbook.add_format()
            percent_format.set_num_format('0,0%')
            worksheet = workbook.add_worksheet(codi)
            # offset de columnes de dades dels alumnes
            #   nom, email, equip
            offset = 3
            worksheet.write(0,0,"Cognoms, Nom",header)
            worksheet.write(0,1,"Email",header)
            worksheet.write(0,2,"Equip",header)
            worksheet.write(1,0,"Hores",header)
            worksheet.write(1,1,"",header)
            worksheet.write(1,2,"",header)
            # ajustem amplades i alçada de les primeres files
            worksheet.set_column("A:A", 20)
            worksheet.set_column("B:B", 20)
            worksheet.set_column("C:C", 15)
            worksheet.set_row(0, 40)
            col = 0
            for sprint in projecte.sprints.all():
                worksheet.write(0,offset+col,sprint.nom,header)
                #print(sprint.dades_mps())
                mp_sprint = sprint.dades_mps()
                if mp_sprint.get(mp.nom):
                    worksheet.write(1,offset+col,sprint.dades_mps()[mp.nom]["hores"],header)
                else:
                    worksheet.write(1,offset+col,0,header)
                col += 1
            worksheet.write(1,offset+col,"",header)
            worksheet.write(1,offset+col+1,"",header)
            worksheet.write(1,offset+col+2,"",header)
            worksheet.write(0,offset+col,"Hores totals",header)
            worksheet.write(0,offset+col+1,"Hores completades",header)
            worksheet.write(0,offset+col+2,"Nota ponderada",header)
            
            # offset rows=2; 0 = títols, 1 = Hores (ponderacions)
            row = 2
            for equip in projecte.equips.all():
                for alumne in equip.membres.all():
                    worksheet.write(row,0,alumne.last_name+", "+alumne.first_name)
                    worksheet.write(row,1,alumne.email)
                    worksheet.write(row,2,equip.nom)
                    col = 0
                    hores_totals = 0
                    hores_completades = 0
                    for sprint in projecte.sprints.all():
                        qualificacions = equip.qualificacions.filter(sprint=sprint)
                        if qualificacions:
                            quali_per_mps = qualificacions.first().hores_completades_per_mps()
                            if quali_per_mps.get(mp.id):
                                quali = quali_per_mps[mp.id]["done"]/quali_per_mps[mp.id]["total"]
                                worksheet.write(row,offset+col,quali,percent_format)
                                hores_totals += quali_per_mps[mp.id]["total"]
                                hores_completades += quali_per_mps[mp.id]["done"]
                        # bucle sprints
                        col += 1
                    # bucle alumnes
                    worksheet.write(row,offset+col,hores_totals)
                    worksheet.write(row,offset+col+1,hores_completades)
                    worksheet.write(row,offset+col+2,hores_completades/hores_totals,percent_format)
                    row += 1
        workbook.close()

        # Enviem arxiu a l'usuari
        filename = "Qualificacions_projecte_{}.xlsx".format(projecte.nom)
        with open(path, 'rb') as fh:
            response = HttpResponse(fh.read(), content_type="application/vnd.ms-excel")
            response['Content-Disposition'] = 'inline; filename=' + filename
            return response
    #except Exception as e:
        raise Http404


