from django.contrib import admin

from django.utils.safestring import mark_safe
from easy_select2 import select2_modelform

# Register your models here.

from scrum.models import *

ProjecteForm = select2_modelform(Projecte)
MPForm = select2_modelform(ModulProfessional)
SpecForm = select2_modelform(Spec)
SprintForm = select2_modelform(Sprint)
UFForm = select2_modelform(UnitatFormativa)
EquipForm = select2_modelform(Equip)

class EquipAdmin(admin.ModelAdmin):
	model = Equip
	filter_horizontal = ('membres',)
	list_display = ('nom','projecte','centre','show_membres',)
	#form = EquipForm
	def centre(self,obj):
		return obj.projecte.centre.nom
	def cicle(self,obj):
		return obj.projecte.cicle.nom
	def show_membres(self,obj):
		ret = ""
		for membre in obj.membres.all():
			ret += membre.first_name + " " + membre.last_name \
				+ " (<a href='/admin/core/user/"+str(membre.id)+"'>" + membre.username+"</a>)<br>\n"
		return mark_safe(ret)

class ProjecteAdmin(admin.ModelAdmin):
	model = Projecte
	form = ProjecteForm
	list_display = ('nom','centre','inici','final',)

class MPAdmin(admin.ModelAdmin):
	model = ModulProfessional
	form = MPForm
	list_display = ('nom','numero','cicle')
	ordering = ('cicle','numero')

class SpecAdmin(admin.ModelAdmin):
	model = Spec
	search_fields = ('projecte__nom','mp__nom',)
	filter_horizontal = ('mp',)
	list_display = ('nom','projecte','moduls','ordre',)
	list_editable = ('ordre',)
	ordering = ('projecte','ordre',)
	form = SpecForm
	def moduls(self,obj):
		mps = ""
		for mp in obj.mp.all():
			mps += mp.nom + "<br>"
		return mark_safe(mps)

class SprintAdmin(admin.ModelAdmin):
	model = Sprint
	list_display = ('nom','projecte','ordre','inici','final')
	form = SprintForm

admin.site.register( Projecte, ProjecteAdmin )
admin.site.register( Spec, SpecAdmin )
admin.site.register( Sprint, SprintAdmin )
admin.site.register( ModulProfessional, MPAdmin )
#admin.site.register( UnitatFormativa )
admin.site.register( Equip, EquipAdmin )
