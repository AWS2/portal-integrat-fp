from django.db import models
from django.conf import settings

from django.contrib.auth.models import AbstractUser
from django.utils.safestring import mark_safe

# Create your models here.

from django.contrib.gis.db import models as gismodels
from django.contrib.gis.geos import Point
from djrichtextfield.models import RichTextField



class User(AbstractUser):
	# foto alumne o logo admin empresa
	imatge = models.ImageField(upload_to='imatgesPerfil', blank=True)
	# cv
	arxiu = models.FileField(upload_to='docPerfil', blank=True)
	descripcio = RichTextField(blank=True,null=True)
	localitzacio = gismodels.PointField(null=True,default=Point(0,0))
	def mostrar_imatge(self):
		return mark_safe('<img src="'+settings.MEDIA_URL+'%s" width="90" height="90"/>' % (self.imatge))
	mostrar_imatge.short_description = 'Avatar'
	#def save(self): hay que cambiar el metodo de guardar para la imagen


class Categoria(models.Model):
	nom = models.CharField(max_length=255,unique=True)
	descripcio = RichTextField(blank=True,null=True)
	pare = models.ForeignKey('self',
			on_delete=models.CASCADE,
			null=True, blank=True, default=None)
	def __str__(self):
		return self.nom


class Cicle(models.Model):
	GRAU = (
		('CFGM',"Grau Mitjà"),
		('CFGS',"Grau Superior"),
		)
	grau = models.CharField(max_length=4,choices=GRAU)
	codi = models.CharField(max_length=4,unique=True)
	nom = models.CharField(max_length=255,unique=True)
	pladestudis = models.URLField(blank=True,null=True)
	familia = models.ForeignKey(Categoria,on_delete=models.CASCADE,null=True)
	descripcio = RichTextField()
	def __str__(self):
		return self.nom


# centre educatiu o centre de treball (empresa)
class Centre(models.Model):
	educatiu = models.BooleanField(help_text="Si no és centre educatiu, és centre de treball.")
	nom = models.CharField(max_length=255)
	direccio = RichTextField()
	poblacio = models.CharField(max_length=255)
	cp = models.CharField(max_length=5)
	telefon = models.IntegerField()
	email = models.EmailField()
	web = models.URLField(blank=True)
	# loc inicial al mar, enfront al Maresme (2.6875,41.5600)
	localitzacio = gismodels.PointField(blank=True,default=Point(2.6875,41.5600))
	descripcio = RichTextField(blank=True)
	# usuaris administradors
	admins = models.ManyToManyField(User,blank=True,related_name="admin")
	# només per centres educatius
	cicles = models.ManyToManyField(Cicle,blank=True)
	# logo empresa o centre educatiu
	imatge = models.ImageField(upload_to='imatgesCentre', blank=True)
	# si es empresa, adscrita a ceentres educatius
	adscripcio = models.ManyToManyField('self',blank=True)
	def __str__(self):
		return self.nom

