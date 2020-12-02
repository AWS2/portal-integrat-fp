from django import template



register = template.Library()

@register.filter
def dels_grups_de(feedbacks,usuari):
	if usuari.es_profe or usuari.is_superuser:
		return feedbacks.all()
	return feedbacks.filter(usuari=usuari)

@register.filter
def compte_dels_grups_de(feedbacks,usuari):
	if usuari.es_profe or usuari.is_superuser:
		return feedbacks.count()
	return feedbacks.filter(usuari=usuari).count()

