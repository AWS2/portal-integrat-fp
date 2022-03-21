from django.test import TestCase
from django.urls import reverse

# Aquest seria el model de User simple habitual en un test
#from django.contrib.auth.models import User
# Aquest altre és el model alternatiu quan tenim un User personalitzat
from django.contrib.auth import get_user_model
User = get_user_model()

class ScrumTests(TestCase):
    def test_create_superuser(self):
        # Creem un superusuari
        User.objects.create_superuser('admin', 'admin@borsa.com', 'admin123')
        # ens loguem amb email enlloc del username
        login = self.client.login(username='admin@borsa.com',password='admin123')
        self.assertTrue(login)
        # visitem la pàgina principal del panell de control /admin
        response = self.client.get('/admin/')
        # comprovem que el login és correcte si apareix "Benvingut/da" al HTML
        self.assertTrue( "Benvingut/da" in str(response.content) )

