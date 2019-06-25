from django.contrib import admin

from django.contrib.gis.admin import OSMGeoAdmin
from django.contrib.auth.admin import UserAdmin

# Register your models here.

from core.models import *

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
