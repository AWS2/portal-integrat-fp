from django.contrib import admin

# Register your models here.

from borsApp.models import *

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

admin.site.register( Titol, TitolAdmin )
admin.site.register( Subscripcio, SubscripcioAdmin )
admin.site.register( Oferta )

