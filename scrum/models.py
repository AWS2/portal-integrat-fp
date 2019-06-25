from django.db import models
from djrichtextfield.models import RichTextField

# Create your models here.

from borsApp.models import User, Centre, Cicle


class ModulProfessional(models.ModelAdmin):
	numero = models.IntegerField(default=0)
	nom = models.CharField(max_length=255)
	descripcio = RichTextField()
	cicle = models.ForeignKey(Cicle,on_delete=models.SET_NULL)
	def __str__(self):
		return self.nom

class UnitatFormativa(models.ModelAdmin):
	numero = models.IntegerField(default=0)
	nom = models.CharField(max_length=255)
	descripcio = RichTextField()
	mp = models.ForeignKey(ModulProfessional,on_delete=models.CASCADE)
	def __str__(self):
		return self.nom

class Projecte(models.ModelAdmin):
	nom = models.CharField(max_length=255)
	descripcio = RichTextField()
	centre = models.ForeignKey(Centre,on_delete=models.CASCADE)
	admins = models.ManyToManyField(User)
	inici = models.DateTimeField(auto_now_add=True)
	final = models.DateTimeField()
	def __str__(self):
		return self.nom

class Equip(models.ModelAdmin):
	nom = models.CharField(max_length=255)
	descripcio = RichTextField()
	projecte = models.ForeignKey(Projecte,on_delete=models.CASCADE)
	# TODO: permisos (read, write, etc.)
	def __str__(self):
		return self.nom

class Spec(models.ModelAdmin):
	nom = models.CharField(max_length=255)
	descripcio = RichTextField()
	pare = models.ForeignKey('self',on_delete=models.CASCADE,null=True)
	projecte = models.ForeignKey(Projecte,on_delete=models.CASCADE)
	ordre = models.IntegerField(default=0)
	def __str__(self):
		return self.nom

class Sprint(models.ModelAdmin):
	nom = models.CharField(max_length=255)
	notes = RichTextField()
	projecte = models.ForeignKey(Projecte,on_delete=models.CASCADE)
	ordre = models.IntegerField(default=0)
	def __str__(self):
		return self.nom
	def save(self, *args, **kwargs):
		super().save(*args,**kwargs)
		# si no posem nº ordre, li asignem la pròpia ID pq sigui un sprint correlatiu
		if self.ordre == 0:
			self.ordre = self.id
			super().save(*args,**kwargs)

