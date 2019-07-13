from django.contrib import admin
from django import forms

# Register your models here.

from borsApp.models import *

# no cal form de select2 pq ho posem per a tot l'admin amb django-admin-select2
"""from easy_select2 import select2_modelform
from django_select2.forms import Select2Widget

TitolForm = select2_modelform(Titol)#,attrs={"width":"450px"})
SubscripcioForm = select2_modelform(Subscripcio)"""

class TitolAdmin(admin.ModelAdmin):
	list_display = ('alumne','nom','cicle','centre')
	# no cal form de select2 pq ho posem per a tot l'admin amb django-admin-select2
	#form = TitolForm
	def nom(self,obj):
		return obj.alumne.first_name+" "+obj.alumne.last_name+" (email: "+obj.alumne.email+")"

class SubscripcioAdmin(admin.ModelAdmin):
	list_display = ('alumne','centre_educatiu','centre_treball','get_cats','get_cicles','distancia')
	#form = SubscripcioForm
	filter_horizontal = ('categories','cicles')
	def get_cats(self,obj):
		ret = ""
		for cat in obj.categories.all():
			ret += str(cat) + ", "
		return ret
	def get_cicles(self,obj):
		ret = ""
		for cicle in obj.cicles.all():
			ret += str(cicle) + ", "
		return ret
	def get_form(self,request,obj=None,**kwargs):
		# l'alumne no pot triar quin alumne subscriu. Els admins sí
		self.exclude = None
		if request.user.es_alumne:
			self.exclude = ('alumne',)
		return super().get_form(request,obj,**kwargs)
	def formfield_for_foreignkey(slef,db_field,request=None,**kwargs):
		# filtre camp alumne
		if db_field.name=="alumne":
			if request.user.es_admin_centre:
				# filtrem els usuaris del centre del qual es admin
				kwargs["queryset"] = User.objects.filter(centre__in=request.user.centres_admin.all())
			elif request.user.es_alumne:
				kwargs["queryset"] = User.objects.none()
			elif request.user.is_superuser:
				kwargs["queryset"] = User.objects.all()
		if db_field.name == "centre_educatiu":
			# filtrar centres educatius
			kwargs["queryset"] = Centre.objects.filter(educatiu=True)
		if db_field.name == "centre_treball":
			# filtrar empreses
			kwargs["queryset"] = Centre.objects.filter(educatiu=False)
		return super().formfield_for_foreignkey(db_field,request=request,**kwargs)
	def save_model(self,request,obj,form,change):
		# forcem alumne a ser l'usuari en curs
		# els admins poden subscriure qualsevol alumne
		if request.user.es_alumne:
			obj.alumne = request.user
		super().save_model(request,obj,form,change)
	def get_queryset(self,request):
		if request.user.is_superuser:
			# superuser ho veu tot
			return super().get_queryset(request)
		elif request.user.es_admin_centre:
			# els admins veuen tot lo del seu centre
			centres = request.user.centres_admin.all()
			return super().get_queryset(request).filter(alumne__centre__in=centres)
		# nomes mostrem les de l'alumne
		return super().get_queryset(request).filter(alumne=request.user)



class TitolInline(admin.TabularInline):
	model = Titol
	#form = TitolForm
	extra = 1
	readonly_fields = ('descripcio',)
class SubscripcioInline(admin.StackedInline):
	model = Subscripcio
	#form = SubscripcioForm
	extra = 1

#OfertaForm = select2_modelform(Oferta)
class OfertaAdmin(admin.ModelAdmin):
	model = Oferta
	#form = OfertaForm
	filter_horizontal = ('cicles',)
	exclude = ('creador',)
	list_display = ('titol','empresa','inici','final','activa',)
	ordering = ('-inici','empresa',)
	def save_model(self,request,obj,form,change):
		# afegim l'usuari creador de la oferta
		obj.creador = request.user
		super().save_model(request,obj,form,change)
	def get_queryset(self,request):
		# super ho veu tot
		if request.user.is_superuser:
			return super().get_queryset(request)
		# els admins centre veuen els seus
		if request.user.es_admin_centre:
			# TODO: acabar-ho
			return super().get_queryset(request)
		# la resta (alumnes) veuen només els que estan subscrits
		subs = Subscripcio.objects.filter(alumne=request.user)
		# filtrem nomes per cicles de moemnt
		# TODO: acabar-ho (afegir filtratge per centre?)
		cicles = []
		for sub in subs.all():
			for cicle in sub.cicles.all():
				cicles.append(cicle.id) 
		qs = super().get_queryset(request).filter(cicles__in=cicles,activa=True)
		return qs


admin.site.register( Titol, TitolAdmin )
admin.site.register( Subscripcio, SubscripcioAdmin )
admin.site.register( Oferta, OfertaAdmin )

