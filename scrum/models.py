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
	def __str__(self):
		return self.nom

class Equip(models.Model):
	nom = models.CharField(max_length=255)
	descripcio = RichTextField()
	projecte = models.ForeignKey(Projecte,on_delete=models.CASCADE)
	membres = models.ManyToManyField(User)
	# TODO: permisos (read, write, etc.)
	def __str__(self):
		return self.nom

class Spec(models.Model):
	nom = models.CharField(max_length=255)
	descripcio = RichTextField()
	pare = models.ForeignKey('self',on_delete=models.CASCADE,null=True,blank=True)
	projecte = models.ForeignKey(Projecte,on_delete=models.CASCADE)
	ordre = models.IntegerField(default=0)
	mp = models.ManyToManyField(ModulProfessional,blank=True,help_text="Mòdul Professional")
	def __str__(self):
		return self.nom

class Sprint(models.Model):
	nom = models.CharField(max_length=255)
	notes = RichTextField(blank=True)
	projecte = models.ForeignKey(Projecte,on_delete=models.CASCADE)
	ordre = models.IntegerField(default=0)
	inici = models.DateField(default=datetime.datetime.now)
	final = models.DateField()
	def __str__(self):
		return self.nom
	def save(self, *args, **kwargs):
		super().save(*args,**kwargs)
		# si no posem nº ordre, li asignem la pròpia ID pq sigui un sprint correlatiu
		if self.ordre == 0:
			self.ordre = self.id
			super().save(*args,**kwargs)

