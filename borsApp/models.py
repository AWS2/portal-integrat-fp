from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.safestring import mark_safe
from django.conf import settings

# Create your models here.


class Categoria(models.Model):
	nom = models.CharField(max_length=255,unique=True)
	descripcio = models.TextField(blank=True,null=True)
	pare = models.ForeignKey('self',
			on_delete=models.CASCADE,
			null=True, blank=True, default=None)
	def __str__(self):
		return self.nom

class User(AbstractUser):
	imatge = models.ImageField(upload_to='imatgesPerfil', blank=True)
	arxiu = models.FileField(upload_to='docPerfil', blank=True)
	categoria = models.ManyToManyField(Categoria)
	descripcio = models.TextField(blank=True,null=True)
	
	def mostrar_imatge(self):
		return mark_safe('<img src="'+settings.MEDIA_URL+'%s" width="90" height="90"/>' % (self.imatge))
	''
	mostrar_imatge.short_description = 'Avatar'
    #imatge = models.ImageField(upload_to=_generar_ruta_imagen)
	#def save(self): hay que cambiar el metodo de guardar para la imagen


class Centre(models.Model):
	nom = models.CharField(max_length=255)
	direccio = models.TextField()
	poblacio = models.CharField(max_length=255)
	cp = models.CharField(max_length=5)
	telefon = models.IntegerField()
	email = models.EmailField()
	web = models.URLField()

class Cicle(models.Model):
	GRAU = (
		('CFGM',"Grau Mitjà"),
		('CFGS',"Grau Superior"),
		)
	grau = models.CharField(max_length=4,choices=GRAU)
	codi = models.CharField(max_length=4,unique=True)
	nom = models.CharField(max_length=255,unique=True)
	pladestudis = models.URLField(blank=True,null=True)
	familia = models.ForeignKey(Categoria,on_delete=models.CASCADE)
	descripcio = models.TextField()
	def __str__(self):
		return self.nom

class Oferta(models.Model):
	pass

class Demandes(models.Model):
	pass

