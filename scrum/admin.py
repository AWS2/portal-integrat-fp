from django.contrib import admin
from django import forms

from django.utils.safestring import mark_safe
from easy_select2 import select2_modelform

# Register your models here.

from scrum.models import *

ProjecteForm = select2_modelform(Projecte)
SprintForm = select2_modelform(Sprint)
EquipForm = select2_modelform(Equip)
SpecForm = select2_modelform(Spec)

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

from urllib.parse import urlsplit
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
	def formfield_for_manytomany(self, db_field, request=None, **kwargs):
		if db_field.name == 'mp':
			try:
				parts = request.get_raw_uri().split("/")
				i = parts.index("spec")
				#print("I="+str(i))
				obj_id = parts[i+1]
				#print(obj_id)
				obj = self.get_object(request,obj_id)
				if obj:
					kwargs['queryset'] = ModulProfessional.objects.filter(cicle=obj.projecte.cicle).order_by('numero')
			except:
				print("ERROR in formfield_for_manytomany (SpecAdmin)")
		return super().formfield_for_manytomany(db_field, request=request, **kwargs)

class SprintAdmin(admin.ModelAdmin):
	model = Sprint
	list_display = ('nom','projecte','ordre','inici','final')
	form = SprintForm

admin.site.register( Projecte, ProjecteAdmin )
admin.site.register( Spec, SpecAdmin )
admin.site.register( Sprint, SprintAdmin )
admin.site.register( Equip, EquipAdmin )
