from django.utils import timezone
from django.db import models
from django.conf import settings

from django.contrib.gis.db import models as gismodels
from django.contrib.gis.geos import Point
from djrichtextfield.models import RichTextField


from core.models import User, Cicle, Centre, Categoria
from borsApp.models import Empresa

# Create your models here.
class DemandaDual(models.Model):
	class Meta:
		verbose_name_plural = "DemandesDual"
	inici = models.DateTimeField(default=timezone.now)
	# TODO: check timedelta
	final = models.DateTimeField()
	activa = models.BooleanField(default=True)
	empresa = models.ForeignKey(Empresa,on_delete=models.CASCADE,null=True)
	centres=models.ManyToManyField(Centre)
	cicles = models.ManyToManyField(Cicle)
	titol = models.CharField(max_length=255)
	descripcio = RichTextField()
	creador = models.ForeignKey(User,on_delete=models.SET_NULL,null=True)
	categories = models.ManyToManyField(Categoria,blank=True)
	def __str__(self):
		return self.titol+" ("+self.empresa.nom+")"