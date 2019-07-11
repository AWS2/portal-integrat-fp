from django.db import models
from django.conf import settings

from django.contrib.gis.db import models as gismodels
from django.contrib.gis.geos import Point
from djrichtextfield.models import RichTextField


from core.models import User, Cicle, Centre, Categoria

# Create your models here.


# titol de CF obtingut per un alumne
class Titol(models.Model):
	cicle = models.ForeignKey(Cicle,on_delete=models.SET_NULL,null=True)
	centre = models.ForeignKey(Centre,on_delete=models.SET_NULL,null=True)
	graduat = models.BooleanField()
	data = models.DateField(help_text="Data de graduació de l'alumne",blank=True,null=True)
	alumne = models.ForeignKey(User,on_delete=models.CASCADE,related_name="titols")
	# guardar descripció títol per si s'esborra el títol de referència
	descripcio = RichTextField(blank=True)
	def __str__(self):
		return str(self.alumne.first_name+" "+self.alumne.last_name+" | "+self.cicle.nom)


# Alertes d'ofertes de feina
class Subscripcio(models.Model):
	class Meta:
		verbose_name_plural = "Subscripcions"
	alumne = models.ForeignKey(User,on_delete=models.CASCADE)
	# centre al què està adscrit l'alumne (títol) o bé el centre de treball
	centre_educatiu = models.ForeignKey(Centre,on_delete=models.CASCADE,null=True,blank=True,
					help_text="Rebre les ofertes dirigides a aquest centre",
					related_name="subscripcions_educatiu")
	centre_treball = models.ForeignKey(Centre,on_delete=models.CASCADE,null=True,blank=True,
					help_text="Rebre les ofertes d'aquesta empresa",
					related_name="subscipcions_treball")
	categories = models.ManyToManyField(Categoria,blank=True,
					help_text="Rebre les ofertes que estiguin en aquestes categories")
	cicles = models.ManyToManyField(Cicle,
					help_text="Rebre les ofertes relacionades amb aquests cicles")
	# distancia en km al centre (educatiu o de treball)
	# si és 0.0 o negatiu s'entén que a qualsevol distància
	distancia = models.FloatField(default=0.0,
					help_text="Si la distància és 0 no es tindrà en compte aquest paràmetre")
	creat = models.DateTimeField(auto_now_add=True)
	modificat = models.DateTimeField(auto_now=True)


from django.utils import timezone

class Oferta(models.Model):
	class Meta:
		verbose_name_plural = "Ofertes"
	inici = models.DateTimeField(default=timezone.now)
	# TODO: check timedelta
	final = models.DateTimeField()
	activa = models.BooleanField(default=True)
	empresa = models.ForeignKey(Centre,on_delete=models.CASCADE,null=True)
	cicles = models.ManyToManyField(Cicle)
	titol = models.CharField(max_length=255)
	descripcio = RichTextField()


class Demandes(models.Model):
	pass

