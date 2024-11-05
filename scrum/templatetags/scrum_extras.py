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

@register.filter
def del_equip(qualificacions,equip):
	return qualificacions.filter(equip=equip)

@register.filter
def youtube(url):
	video_id = ""
	if "embed" in url:
		return url
	elif "youtu.be" in url:
		video_id = url.split(".be/")[1]
	else:
		video_id = url.split("?v=")[1]
	
	return "https://www.youtube.com/embed/{}".format(video_id)

