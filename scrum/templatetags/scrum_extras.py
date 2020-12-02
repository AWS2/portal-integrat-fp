from django import template



register = template.Library()

@register.filter
def dels_grups_de(feedbacks,usuari):
	if usuari.es_profe or usuari.is_superuser:
		return feedbacks.all()
	equips = usuari.equips.filter(membres__in=[usuari])
	return feedbacks.filter(equip__in=equips)

@register.filter
def compte_dels_grups_de(feedbacks,usuari):
	if usuari.es_profe or usuari.is_superuser:
		return feedbacks.count()
	equips = usuari.equips.filter(membres__in=[usuari])
	return feedbacks.filter(equip__in=equips).count()

