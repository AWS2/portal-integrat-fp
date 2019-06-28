from django.contrib import admin

from django.contrib.gis.admin import OSMGeoAdmin
from django.contrib.auth.admin import UserAdmin
from django.utils.safestring import mark_safe
from easy_select2 import select2_modelform

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
	ordering = ('familia','nom',)
	search_fields = ('grau','codi','nom','familia__nom','descripcio')
	inlines = ( MPInline, )

class CentreAdmin(OSMGeoAdmin):
	list_display = ('nom','localitzacio')
	search_fields = ('nom','direccio','poblacio')
	filter_horizontal = ('admins','cicles','adscripcio')

UFForm = select2_modelform(UnitatFormativa)
MPForm = select2_modelform(ModulProfessional)
class UFInline(admin.TabularInline):
	model = UnitatFormativa
	extra = 0
	exclude = ('descripcio',)
class MPAdmin(admin.ModelAdmin):
	model = ModulProfessional
	form = MPForm
	list_display = ('nom','numero','codi_cicle','cicle',)
	ordering = ('cicle','numero')
	inlines = [ UFInline, ]
	def codi_cicle(self,obj):
		return obj.cicle.codi
admin.site.register( ModulProfessional, MPAdmin )
#admin.site.register( UnitatFormativa )


from borsApp.admin import TitolInline, SubscripcioInline

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


admin.site.site_title = "Gestió portal integrat"
admin.site.site_header = mark_safe("Administració | <a href='/login'>->social login<-</a>")

