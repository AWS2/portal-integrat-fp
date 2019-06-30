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
	projecte = models.ForeignKey(Projecte,on_delete=models.CASCADE)
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
