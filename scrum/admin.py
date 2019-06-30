from django.contrib import admin
from django import forms

from django.utils.safestring import mark_safe
from easy_select2 import select2_modelform
from adminsortable2.admin import SortableAdminMixin
from adminsortable2.admin import SortableInlineAdminMixin

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

class SpecInline(SortableInlineAdminMixin,admin.TabularInline):
	model = Spec
	form = SpecForm
	exclude = ('descripcio','pare')
	extra = 0
	# restrict mps al cicle
	def formfield_for_manytomany(self, db_field, request=None, **kwargs):
		if db_field.name == 'mp':
			try:
				parts = request.get_raw_uri().split("/")
				i = parts.index("projecte")
				print("I="+str(i))
				obj_id = parts[i+1]
				print(obj_id)
				# obj és un projecte
				obj = Projecte.objects.get(pk=obj_id)
				print(obj.id)
				if obj:
					kwargs['queryset'] = ModulProfessional.objects.filter(cicle=obj.cicle).order_by('numero')
				else:
					kwargs['queryset'] = ModulProfessional.objects.none()
			except:
				print("ERROR in formfield_for_manytomany (SpecInline)")
		return super().formfield_for_manytomany(db_field, request=request, **kwargs)
class SprintInline(admin.TabularInline):
	model = Sprint
	form = SprintForm
	ordering = ('inici',)
	exclude = ('notes',)
	extra = 0
	# restrict specs al proj
	def formfield_for_manytomany(self, db_field, request=None, **kwargs):
		if db_field.name == 'specs':
			try:
				parts = request.get_raw_uri().split("/")
				i = parts.index("projecte")
				#print("I="+str(i))
				obj_id = parts[i+1]
				#print(obj_id)
				if obj_id:
					kwargs['queryset'] = Spec.objects.filter(projecte=obj_id).order_by('ordre')
				else:
					kwargs['queryset'] = Spec.objects.none()
			except:
				print("ERROR in formfield_for_manytomany (SprintInline)")
		return super().formfield_for_manytomany(db_field, request=request, **kwargs)

class ProjecteAdmin(admin.ModelAdmin):
	model = Projecte
	form = ProjecteForm
	list_display = ('nom','centre','inici','final',)
	inlines = ( SprintInline, SpecInline, )

from urllib.parse import urlsplit
class SpecAdmin(SortableAdminMixin,admin.ModelAdmin):
	model = Spec
	search_fields = ('projecte__nom','mp__nom',)
	filter_horizontal = ('mp',)
	list_display = ('nom','projecte','moduls','ordre',)
	ordering = ('ordre',)
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
				else:
					kwargs['queryset'] = Spec.objects.none()
			except:
				print("ERROR in formfield_for_manytomany (SpecAdmin)")
		return super().formfield_for_manytomany(db_field, request=request, **kwargs)


class SprintAdmin(admin.ModelAdmin):
	model = Sprint
	list_display = ('nom','projecte','inici','final')
	form = SprintForm
	filter_horizontal = ('specs',)
	ordering = ['inici',]
	search_fields = ('projecte__nom',)
	def formfield_for_manytomany(self, db_field, request=None, **kwargs):
		if db_field.name == 'specs':
			try:
				parts = request.get_raw_uri().split("/")
				i = parts.index("sprint")
				#print("I="+str(i))
				obj_id = parts[i+1]
				print(obj_id)
				obj = self.get_object(request,obj_id)
				if obj:
					kwargs['queryset'] = Spec.objects.filter(projecte=obj.projecte).order_by('ordre')
				else:
					kwargs['queryset'] = Spec.objects.none()
			except:
				print("ERROR in formfield_for_manytomany (SprintAdmin)")
		return super().formfield_for_manytomany(db_field, request=request, **kwargs)

admin.site.register( Projecte, ProjecteAdmin )
admin.site.register( Spec, SpecAdmin )
admin.site.register( Sprint, SprintAdmin )
admin.site.register( Equip, EquipAdmin )
