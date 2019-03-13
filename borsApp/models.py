from django.db import models

# Create your models here.

class Categoria(models.Model):
	nom = models.CharField(max_length=255)
	descripcio = models.TextField(blank=True,null=True)
	pare = models.ForeignKey('self',
			on_delete=models.CASCADE,
			null=True, default=None)
	def __str__(self):
		return self.nom

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
	codi = models.CharField(max_length=4)
	nom = models.CharField(max_length=255)
	pladestudis = models.URLField(blank=True,null=True)
	familia = models.ForeignKey(Categoria,on_delete=models.CASCADE)
	descripcio = models.TextField()
	def __str__(self):
		return self.nom

class Oferta(models.Model):
	pass

class Demandes(models.Model):
	pass

