from django.contrib import admin
from django.contrib.gis.admin import OSMGeoAdmin
from django.contrib.auth.admin import UserAdmin

# Register your models here.

from borsApp.models import *

class CatAdmin(admin.ModelAdmin):
	model = Categoria
	list_display = ('nom','pare','descripcio')
	search_fields = ('nom','pare__nom')
	ordering = ('pare','nom',)

class CicleAdmin(admin.ModelAdmin):
	list_display = ('nom','familia')
	ordering = ('familia','nom',)
	search_fields = ('grau','codi','nom','familia__nom','descripcio')

class CentreAdmin(OSMGeoAdmin):
	list_display = ('nom','localitzacio')
	search_fields = ('nom','direccio','poblacio')
	filter_horizontal = ('admins','cicles','adscripcio')

from easy_select2 import select2_modelform

TitolForm = select2_modelform(Titol)#,attrs={"width":"450px"})
SubscripcioForm = select2_modelform(Subscripcio)

class TitolAdmin(admin.ModelAdmin):
	list_display = ('alumne','cicle','centre')
	form = TitolForm

class SubscripcioAdmin(admin.ModelAdmin):
	list_display = ('alumne','centre','distancia')
	form = SubscripcioForm

class TitolInline(admin.TabularInline):
	model = Titol
	form = TitolForm
	extra = 0
class SubscripcioInline(admin.StackedInline):
	model = Subscripcio
	form = SubscripcioForm
	extra = 1
class MyUserAdmin(UserAdmin):
	fieldsets = UserAdmin.fieldsets + (
            (None, {
				'fields': ('imatge','mostrar_imatge','arxiu','descripcio'),
			}),
	)
	inlines = [ TitolInline, SubscripcioInline, ]
	readonly_fields = ['mostrar_imatge']


admin.site.register( Categoria, CatAdmin )
admin.site.register( Cicle, CicleAdmin )
admin.site.register( Centre, CentreAdmin )
admin.site.register( User, MyUserAdmin )
admin.site.register( Titol, TitolAdmin )
admin.site.register( Subscripcio, SubscripcioAdmin )
admin.site.register( Oferta )

