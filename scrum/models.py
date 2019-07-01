from django.db import models
from djrichtextfield.models import RichTextField
import datetime

# Create your models here.

from core.models import *


class Projecte(models.Model):
	nom = models.CharField(max_length=255)
	descripcio = RichTextField()
	centre = models.ForeignKey(Centre,on_delete=models.CASCADE)
	admins = models.ManyToManyField(User)
	inici = models.DateField(default=datetime.datetime.now)
	final = models.DateField()
	cicle = models.ForeignKey(Cicle,on_delete=models.SET_NULL,null=True)
	def __str__(self):
		return self.nom

class Equip(models.Model):
	nom = models.CharField(max_length=255)
	descripcio = RichTextField(blank=True)
	projecte = models.ForeignKey(Projecte,on_delete=models.CASCADE,related_name="equips")
	membres = models.ManyToManyField(User)
	# TODO: permisos (read, write, etc.)
	def __str__(self):
		return self.nom

class Spec(models.Model):
	class Meta:
		ordering = ['ordre',]
	nom = models.CharField(max_length=255)
	descripcio = RichTextField(blank=True)
	pare = models.ForeignKey('self',on_delete=models.CASCADE,null=True,blank=True)
	projecte = models.ForeignKey(Projecte,on_delete=models.CASCADE)
	ordre = models.IntegerField(default=0)
	mp = models.ManyToManyField(ModulProfessional,blank=True,help_text="Mòduls Professionals. NOTA: no apareixeran a en la CREACIÓ de la Spec, sinó en l'EDICIÓ")
	def __str__(self):
		return self.nom

class Sprint(models.Model):
	nom = models.CharField(max_length=255)
	notes = RichTextField(blank=True)
	projecte = models.ForeignKey(Projecte,on_delete=models.CASCADE)
	inici = models.DateField()
	final = models.DateField()
	specs = models.ManyToManyField(Spec,blank=True,help_text="NOTA: no apareixeran a en la CREACIÓ del Sprint, sinó en l'EDICIÓ")
	def __str__(self):
		return self.nom

class Qualificacio(models.Model):
	class Meta:
		verbose_name_plural = "Qualificacions"
	equip = models.ForeignKey(Equip,on_delete=models.CASCADE)
	sprint = models.ForeignKey(Sprint,on_delete=models.CASCADE)
	nota = models.FloatField(null=True,blank=True)
	comentaris = RichTextField(blank=True)
	def __str__(self):
		return str(self.equip)+" ("+str(self.sprint)+") : "+str(self.nota)

class DoneSpec(models.Model):
	qualificacio = models.ForeignKey(Qualificacio,on_delete=models.CASCADE,related_name="done_specs")
	spec = models.ForeignKey(Spec,on_delete=models.CASCADE)
	done = models.BooleanField(default=False)
	def __str__(self):
		return str(self.qualificacio.equip.nom)+" ("+str(self.spec.nom)+") : "+str(self.done)


