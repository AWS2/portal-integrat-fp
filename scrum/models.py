from django.db import models
from djrichtextfield.models import RichTextField
import datetime
from django.utils.safestring import mark_safe
from django import forms
from django.utils import timezone

# Create your models here.

from core.models import *


class Projecte(models.Model):
    nom = models.CharField(max_length=255)
    descripcio = RichTextField()
    centre = models.ForeignKey(Centre,on_delete=models.CASCADE)
    admins = models.ManyToManyField(User,help_text="Incloure aquí als professors implicats en el projecte")
    inici = models.DateField(default=datetime.datetime.now)
    final = models.DateField()
    cicle = models.ForeignKey(Cicle,on_delete=models.SET_NULL,null=True)
    def __str__(self):
        return self.nom
    def descripcio_html(self):
        return mark_safe(self.descripcio)
    def mps(self):
        return ModulProfessional.objects.filter(
                    specs__projecte=self).distinct().order_by('nom')

class Equip(models.Model):
    nom = models.CharField(max_length=255)
    descripcio = RichTextField(blank=True)
    projecte = models.ForeignKey(Projecte,on_delete=models.CASCADE,related_name="equips")
    membres = models.ManyToManyField(User,related_name="equips")
    # TODO: permisos (read, write, etc.)
    def __str__(self):
        return self.nom

class Sprint(models.Model):
    nom = models.CharField(max_length=255)
    notes = RichTextField(blank=True)
    projecte = models.ForeignKey(Projecte,on_delete=models.CASCADE,related_name="sprints")
    inici = models.DateField()
    final = models.DateField()
    def __str__(self):
        return self.nom
    def hores(self):
        total = 0
        for spec in self.specs.all():
            if spec.hores_estimades:
                total += spec.hores_estimades
        return total
    def dades_mps(self):
        total_hores = 0
        total_specs = 0
        mps = {}
        for spec in self.specs.all():
            total_specs += 1
            total_hores += spec.hores_estimades
            for mp in spec.mp.all():
                if not mps.get(mp.nom):
                    # init
                    mps[mp.nom] = {"hores":0,'specs':0}
                mps[mp.nom]["specs"] += 1
                mps[mp.nom]["hores"] += spec.hores_estimades
        for mp in mps:
            mps[mp]["percent_hores"] = 0
            mps[mp]["percent_specs"] = 0
            if total_hores != 0:
                mps[mp]["percent_hores"] = 100*mps[mp]["hores"] / total_hores
            if total_specs != 0:
                mps[mp]["percent_specs"] = 100*mps[mp]["specs"] / total_specs
        return mps
            

class Spec(models.Model):
    class Meta:
        ordering = ['ordre',]
    nom = models.CharField(max_length=600)
    descripcio = RichTextField(blank=True)#field_settings={'width':'300'} aqui si q funciona
    pare = models.ForeignKey('self',on_delete=models.CASCADE,null=True,blank=True)
    projecte = models.ForeignKey(Projecte,on_delete=models.CASCADE)
    ordre = models.IntegerField(default=0)
    mp = models.ManyToManyField(ModulProfessional,related_name="specs",blank=True,
        help_text="Mòduls Professionals. NOTA: no apareixeran a en la CREACIÓ de la Spec, sinó en l'EDICIÓ")
    hores_estimades = models.FloatField(default=0.0)
    sprints = models.ManyToManyField(Sprint,related_name="specs",blank=True)
    def __str__(self):
        return str(self.ordre) + ". " + self.nom
    def show_sprints(self):
        ret = ""
        for sprint in self.sprints.all():
            ret += str(sprint.nom) + " , "
        return ret
    def comentaris_grup(self,request):
        qs = self.feedbacks.filter(usuari=request.user)
        return qs


class Qualificacio(models.Model):
    class Meta:
        verbose_name_plural = "Qualificacions"
    equip = models.ForeignKey(Equip,on_delete=models.CASCADE,
                        related_name="qualificacions")
    sprint = models.ForeignKey(Sprint,on_delete=models.CASCADE,
                        related_name="qualificacions")
    nota = models.FloatField(null=True,blank=True)
    comentaris = RichTextField(blank=True)
    def __str__(self):
        return str(self.equip)+" ("+str(self.sprint)+")"
    def projecte(self):
        return self.sprint.projecte.nom
    def membres(self):
        ret = ""
        for membre in self.equip.membres.all():
            ret += membre.first_name + " " + membre.last_name + "<br>\n"
        return mark_safe(ret)
    def specs_completades(self):
        total = 0
        done = 0
        for spec in self.done_specs.all():
            total += 1
            if spec.done:
                done += 1
        if total==0:
            return "-"
        return "{} ({:.1f}%)".format(done,round(100*done/total,1))
    def hores_completades(self):
        total = 0
        done = 0
        for spec in self.done_specs.all():
            total += spec.spec.hores_estimades
            if spec.done:
                done += spec.spec.hores_estimades
        if total==0:
            return "-"
        return "{} ({:.1f}%)".format(done,round(100*done/total,1))
    def specs_completades_mps(self):
        # computem specs realitzades, sense tenir en compte les hores
        mps = {}
        for dspec in self.done_specs.all():
            for mp in dspec.spec.mp.all():
                # si no hi ha dict, el creem
                if mp.id not in mps:
                    mps[mp.id] = { "obj": mp, "total": 0, "done": 0 }
                # afegim estadístiques
                mps[mp.id]["total"] += 1
                if dspec.done:
                    mps[mp.id]["done"] += 1
        # construim return string
        ret = ""
        for mpid in mps:
            dades = mps[mpid]
            mp = mps[mpid]["obj"]
            if dades["total"]!=0:
                ret += mp.nom[:4] + " : {}/{} ({:.1f}%)<br>".format(dades["done"],dades["total"],round(100*dades["done"]/dades["total"],1))
        return mark_safe(ret)
    def specs_completades_mps_ponderat(self):
        # computem % d'hores de specs realitzades
        mps = {}
        for dspec in self.done_specs.all():
            for mp in dspec.spec.mp.all():
                # si no hi ha dict, el creem
                if mp.id not in mps:
                    mps[mp.id] = { "obj": mp, "total": 0, "done": 0 }
                # afegim estadístiques
                mps[mp.id]["total"] += dspec.spec.hores_estimades
                if dspec.done:
                    mps[mp.id]["done"] += dspec.spec.hores_estimades
        # construim return string
        ret = ""
        for mpid in mps:
            dades = mps[mpid]
            mp = mps[mpid]["obj"]
            if dades["total"] == 0:
                ret += mp.nom[:4] + " : -<br>"
            else:
                if dades["total"]!=0:
                    ret += mp.nom[:4] + " : {}/{} ({:.1f}%)<br>".format(dades["done"],dades["total"],round(100*dades["done"]/dades["total"],1))
        return mark_safe(ret)
    def hores_completades_per_mps(self):
        # computem % d'hores de specs realitzades
        mps = {}
        for dspec in self.done_specs.all():
            for mp in dspec.spec.mp.all():
                # si no hi ha dict, el creem
                if mp.id not in mps:
                    mps[mp.id] = { "obj": mp, "total": 0, "done": 0 }
                # afegim estadístiques
                mps[mp.id]["total"] += dspec.spec.hores_estimades
                if dspec.done:
                    mps[mp.id]["done"] += dspec.spec.hores_estimades
        return mps

class DoneSpec(models.Model):
    qualificacio = models.ForeignKey(Qualificacio,on_delete=models.CASCADE,
                                            related_name="done_specs")
    spec = models.ForeignKey(Spec,on_delete=models.CASCADE)
    done = models.FloatField(default=0.0)
    nota = models.FloatField(default=0.0)
    def __str__(self):
        return str(self.spec.ordre)+" : "+str(self.spec.nom)


class SpecFeedback(models.Model):
    spec = models.ForeignKey(Spec, on_delete=models.CASCADE, related_name="feedbacks")
    usuari = models.ForeignKey(User, null=True,
            on_delete=models.SET_NULL, related_name="feedbacks")
    equip = models.ForeignKey(Equip, null=True,
            on_delete=models.SET_NULL, related_name="feedbacks")
    data = models.DateTimeField(default=timezone.now)
    hores = models.FloatField(blank=True,null=True)
    desc = RichTextField(blank=True,null=True)

