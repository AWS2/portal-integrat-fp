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

class ProjecteAdmin(admin.ModelAdmin):
	model = Projecte
	form = ProjecteForm

class MPAdmin(admin.ModelAdmin):
	model = ModulProfessional
	form = MPForm
	list_display = ('nom','numero','cicle')
	ordering = ('cicle','numero')

class SpecAdmin(admin.ModelAdmin):
	model = Spec
	filter_horizontal = ('mp',)
	list_display = ('nom','projecte','moduls','ordre',)
	list_editable = ('ordre',)
	ordering = ('projecte','ordre',)
	def moduls(self,obj):
		mps = ""
		for mp in obj.mp.all():
			mps += mp.nom + "<br>"
		return mark_safe(mps)

class SprintAdmin(admin.ModelAdmin):
	model = Sprint
	form = SprintForm

admin.site.register( Projecte, ProjecteAdmin )
admin.site.register( Spec, SpecAdmin )
admin.site.register( Sprint, SprintAdmin )
admin.site.register( ModulProfessional, MPAdmin )
admin.site.register( UnitatFormativa )

