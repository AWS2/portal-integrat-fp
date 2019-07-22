from django.contrib import admin

from django.contrib.gis.admin import OSMGeoAdmin
from django.contrib.auth.admin import UserAdmin
from django.utils.safestring import mark_safe
from django.db.models import Count
from django import forms

#from easy_select2 import select2_modelform

# Register your models here.

from core.models import *

class CatAdmin(admin.ModelAdmin):
	model = Categoria
	list_display = ('nom','pare','descripcio')
	search_fields = ('nom','pare__nom')
	ordering = ('pare','nom',)

class MPInline(admin.TabularInline):
	model = ModulProfessional
	extra = 0
	exclude = ('descripcio',)
class CicleAdmin(admin.ModelAdmin):
	list_display = ('codi','nom','familia')
	list_display_links = ('codi','nom',)
	ordering = ('familia','nom',)
	search_fields = ('grau','codi','nom','familia__nom','descripcio')
	inlines = ( MPInline, )

class CentreAdmin(OSMGeoAdmin):
	list_display = ('nom','educatiu','te_admin','nempreses')
	#ordering = ('te_admin','nom')
	search_fields = ('nom','direccio','poblacio')
	filter_horizontal = ('admins','cicles','adscripcio')
	readonly_fields = ('empreses',)
	def te_admin(self,obj):
		return obj.admins.count()
	te_admin.boolean = True
	te_admin.admin_order_field = "nadmins"
	def nempreses(self,obj):
		return obj.adscrits.count()
	nempreses.admin_order_field = "nempreses"
	def empreses(self,obj):
		res = ""
		for empresa in obj.adscrits.all():
			res += empresa.nom+"<br>"
		return mark_safe(res)
	def get_queryset(self, request):
		queryset = super().get_queryset(request)
		queryset = queryset.annotate(
						nadmins=Count("admins"),
						nempreses=Count("adscrits"),
					).order_by("-nadmins","-nempreses","nom")
		return queryset

# no cal select2_modelform pq amb django-admin-select2 ja funciona
#UFForm = select2_modelform(UnitatFormativa)
#MPForm = select2_modelform(ModulProfessional)
class UFInline(admin.TabularInline):
	model = UnitatFormativa
	extra = 0
	exclude = ('descripcio',)
class MPAdmin(admin.ModelAdmin):
	model = ModulProfessional
	#form = MPForm
	list_display = ('codi_cicle','numero','nom','cicle',)
	list_display_links = ('numero','nom',)
	ordering = ('cicle','numero')
	search_fields = ('cicle__codi','cicle__nom','nom')
	inlines = [ UFInline, ]
	def codi_cicle(self,obj):
		return obj.cicle.codi


from borsApp.admin import TitolInline, SubscripcioInline

#from django.contrib.auth.forms import ReadOnlyPasswordHashField, UserChangeForm
#from django_select2.forms import Select2Widget
#UserForm = select2_modelform(User,attrs={'exclude':'password'})
# no cal select2_modelform pq amb django-admin-select2 ja funciona
class MyUserAdmin(UserAdmin):
	save_on_top = True
	#form = UserForm
	fieldsets = UserAdmin.fieldsets + (
            ("Dades acadèmiques", {
				'fields': ('centre','imatge','mostrar_imatge','arxiu','descripcio'),
			}),
	)
	inlines = [ TitolInline, SubscripcioInline, ]
	readonly_fields = ['mostrar_imatge','last_login','date_joined']
	def mostra_grups(self,obj):
		grups = ""
		for grup in obj.groups.all():
			grups += grup.name + "<br>"
		return mark_safe(grups)
	def mostra_centres_admin(self,obj):
		centres = ""
		for centre in obj.centres_admin.all():
			centres += centre.nom + "<br>"
		return mark_safe(centres)
	def __init__(self,*args,**kwargs):
		super().__init__(*args,**kwargs)
		# reset ordering pq a get_queryset si no, dona un error en altres admins (equips...)
		self.ordering = ('username',)
		self.list_display += ('mostra_centres_admin','mostra_grups','centre','last_login')
	def ncentres(self,obj):
		return obj.centres.count()
	ncentres.admin_order_field = 'ncentres'
	def get_queryset(self,request):
		qs = super().get_queryset(request).annotate(
			ncentres=Count('centres_admin'))
		self.ordering = ('-ncentres','username')
		if not request.user.is_superuser:
			# els usuaris (profes) admins de centre només poden veure els seus usuaris
			centres = request.user.centres_admin.all()
			# TODO: afegir segons titols obtinguts?
			#qs = qs.filter(titols__centre__in=centres).distinct()
			qs = qs.filter(centre__in=centres).distinct()
		return qs
	def save_model(self,request,obj,form,change):
		# si es admin centre cal associar l'usuari al centre de l'admin
		if request.user.es_admin_centre:
			# TODO: revisar que un usuari pot ser admin de 2 centres alhora
			obj.centre = request.user.centres_admin.first()
			# permisos d'alumne pel backend i frontend
			obj.save()
			galumnes = Group.objects.get(name="alumnes")
			obj.groups.add(galumnes)
			obj.is_staff = True
			obj.save()
		# si es superuser ho fa tot
		if request.user.is_superuser:
			super().save_model(request,obj,form,change)


admin.site.register( ModulProfessional, MPAdmin )
#admin.site.register( UnitatFormativa )
admin.site.register( Categoria, CatAdmin )
admin.site.register( Cicle, CicleAdmin )
admin.site.register( Centre, CentreAdmin )
admin.site.register( User, MyUserAdmin )


admin.site.site_title = "Gestió portal integrat"
admin.site.site_header = mark_safe("Administració | <a href='/'>->Anar a inici<-</a>")

