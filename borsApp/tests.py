from django.test import TestCase
from django.db.utils import IntegrityError
from django.contrib.staticfiles.testing import StaticLiveServerTestCase
from selenium.webdriver.firefox.webdriver import WebDriver
from selenium.common.exceptions import NoSuchElementException
from core.models import User

# Create your tests here.


from borsApp.models import *


class BorsaTests(StaticLiveServerTestCase):
    fixtures = ['testdb.json',]
    loged = False
    username = None
    # permisos exclusius de superusuari
    #permisos_only_super = [ 'is_staff','is_superuser','groups','user_permissions']

    @classmethod
    def setUpClass(cls):
        super().setUpClass()
        cls.selenium = WebDriver()
        cls.selenium.implicitly_wait(5)

    @classmethod
    def tearDownClass(cls):
        cls.selenium.quit()
        super().tearDownClass()

    # UTILS
    #######################################
    def ves_al_menu_principal(self):
        self.selenium.find_element_by_xpath('//a[@href="/admin/"]').click()

    def backend_login(self,usuari,contrasenya):
        self.selenium.get('%s%s' % (self.live_server_url, '/admin/login/'))
        username_input = self.selenium.find_element_by_name("username")
        username_input.send_keys(usuari)
        password_input = self.selenium.find_element_by_name("password")
        password_input.send_keys(contrasenya)
        self.selenium.find_element_by_xpath('//input[@value="Iniciar sessió"]').click()
        self.loged = True
        self.username = usuari

    def backend_logout(self):
        self.ves_al_menu_principal()
        self.selenium.find_element_by_xpath('//a[text()="Finalitzar sessió"]').click()
        self.loged = False

    def crea_empresa(self,nom):
        # se suposa que estem logats com a admin_centre
        self.ves_al_menu_principal()
        # anem a crear centre (empresa)
        self.selenium.find_element_by_xpath('//a[@href="/admin/borsApp/empresa/add/"]').click()
        self.selenium.find_element_by_name('nom').send_keys(nom)
        # //field-direccio//html//body[@id="tinymce"]/
        # direccio té el RichTextField amb un iframe pel mig
        #self.selenium.find_element_by_xpath('//div[@class="field-direccio"]//html//body[@id="tinymce"]').send_keys("c. Tal, 1")
        # accedir dins iframe direcció
        self.selenium.switch_to_frame("id_direccio_ifr")
        self.selenium.find_element_by_xpath('//body').send_keys("c. Tal, 1")
        # tornar al main frame
        self.selenium.switch_to_default_content()
        self.selenium.find_element_by_name('poblacio').send_keys("Cornellà")
        self.selenium.find_element_by_name('cp').send_keys("08940")
        self.selenium.find_element_by_name('telefon').send_keys("931112233")
        self.selenium.find_element_by_name('email').send_keys("info@empresaX.com")
        # submit
        self.selenium.find_element_by_xpath('//input[@value="Desar"]').click()
        # comprovem usuari creat OK
        # TODO: millorar test (comprovar no errors/warnings)
        #self.selenium.find_element_by_xpath('//li[@class="success" and contains(text(),"fou afegit amb èxit")]')
        self.selenium.find_element_by_xpath('//li[@class="success"]')

    def ajusta_usuari_empresa(self,usuari,contrasenya):
        # se suposa que estem logats com a admin_centre
        self.ves_al_menu_principal()
        # menu usuaris
        self.selenium.find_element_by_xpath('//a[text()="Usuaris"]').click()
        # accedim a l'usuari de l'empresa acabada de crear
        # el nom de l'usuari és igual al de l'empresa, al menys pels tests
        self.selenium.find_element_by_xpath('//a[text()="'+usuari+'"]').click()
        # anem a canvi de contasenya
        self.selenium.find_element_by_xpath('//a[@href="../password/"]').click()
        self.selenium.find_element_by_name('password1').send_keys(contrasenya)
        self.selenium.find_element_by_name('password2').send_keys(contrasenya)

        self.selenium.find_element_by_xpath('//input[@value="Canviar contrasenya"]').click()
        # comprovem usuari creat OK
        # TODO: millorar test (comprovar no errors/warnings)
        #self.selenium.find_element_by_xpath('//li[@class="success" and contains(text(),"fou afegit amb èxit")]')
        self.selenium.find_element_by_xpath('//li[@class="success"]')

    def check_menu_empresa1(self):
        self.ves_al_menu_principal()
        self.selenium.find_element_by_xpath('//a[text()="Empreses"]').click()
        self.selenium.find_element_by_xpath('//a[text()="empresa1"]').click()

    def crea_oferta(self):
        pass


    # TESTS
    #######################################

    def test_crea_empresa1(self):
        self.backend_login("admin1","enric123")
        # usuari i empresa es diran igual pels tests
        # ULL: no posar noms d'empresa amb espais per tests!!!
        self.crea_empresa("empresa1")
        self.ajusta_usuari_empresa("empresa1","enric123")
        self.check_menu_empresa1()
        # sortim de admin1 per acabar
        self.backend_logout()

    def xtest_admin2_no_veu_empresa1(self):
        self.backend_login("admin2","enric123")
        try:
            self.check_menu_empresa1()
            raise Exception("L'usuari admin2 veu l'empresa1, i no li correspon.")
        except NoSuchElementException as e:
            # si no hi ha l'element "empresa1", anem bé
            pass
        except Exception as e:
            # si és qualsevol altre excepció, la rellancem
            raise e
        self.backend_logout()

    def xtest_empresa_crea_ofertes(self):
        self.backend_login("empresa1","enric123")
        self.crea_oferta()
        self.backend_logout()
        
    def xtest_alumne_veu_ofertes(self):
        # els alumnes del cicle en questió sí que veuen les ofertes
        pass

    def xtest_alumne_no_veu_ofertes(self):
        # els alumnes d'altres cicles NO veuen les ofertes
        pass

