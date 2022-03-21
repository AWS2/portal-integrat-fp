
from django.conf import settings 

#https://stackoverflow.com/questions/433162/can-i-access-constants-in-settings-py-from-templates-in-django

def tiny_key(request):
    # return the value you want as a dictionnary. you may add multiple values in there.
    return {
        'TINYMCE_KEY': settings.TINYMCE_KEY,
    }
