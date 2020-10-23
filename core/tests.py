from django.test import TestCase
from django.contrib.staticfiles.testing import StaticLiveServerTestCase
from selenium.webdriver.firefox.webdriver import WebDriver
from selenium.common.exceptions import NoSuchElementException
from core.models import User

# Create your tests here.

# Per volcar db per a test cal fer amb dumpdata --natural-foreign --natural-primary
# https://code.djangoproject.com/ticket/21278#comment:5
# BEST: ./manage.py dumpdata --indent=4 --natural-foreign --natural-primary > test.json


class BaseCoreTest:
    fixtures = ['testdb.json',]
    #fixtures = ['centres_test.json','groups.json','users.json',]
    loged = False
    username = None
    # permisos exclusius de superusuari
    permisos_only_super = [ 'is_staff','is_superuser','groups','user_permissions']

    # LIB
    ########################################

    def ves_al_menu_principal(self):
        # anar a menu principal
        self.selenium.find_element_by_xpath('//a[@href="/admin/"]').click()

    def backend_login(self,usuari,contrasenya):
        self.selenium.get('%s%s' % (self.live_server_url, '/admin/login/'))
        username_input = self.selenium.find_element_by_name("username")
        username_input.send_keys(usuari)
        password_input = self.selenium.find_element_by_name("password")
        password_input.send_keys(contrasenya)
        self.selenium.find_element_by_xpath('//input[@value="Iniciar sessió"]').click()
        # Comprovem que ens hem logat
        self.selenium.find_element_by_xpath('//a[@href="/admin/logout/"]')
        # si tot ha anat bé, marquem sessió iniciada
        self.loged = True
        self.username = usuari

    def backend_logout(self):
        self.selenium.find_element_by_xpath('//a[text()="Finalitzar sessió"]').click()
        self.loged = False

    def backend_crea_usuari(self,usuari,contrasenya):
        # tornem a menu principal
        self.ves_al_menu_principal()
        # anem a crear usuari
        self.selenium.find_element_by_xpath('//a[@href="/admin/core/user/add/"]').click()
        usuari_input = self.selenium.find_element_by_name('username')
        usuari_input.send_keys(usuari)
        p1_input = self.selenium.find_element_by_name('password1')
        p1_input.send_keys(contrasenya)
        p2_input = self.selenium.find_element_by_name('password2')
        p2_input.send_keys(contrasenya)
        self.selenium.find_element_by_xpath('//input[@value="Desar"]').click()
        # comprovem usuari creat OK
        # TODO: millorar test (comprovar no errors/warnings)
        #self.selenium.find_element_by_xpath('//li[@class="success" and contains(text(),"fou afegit amb èxit")]')
        self.selenium.find_element_by_xpath('//li[@class="success"]')
        # afegim email (camp obligatori) a la 2a pantalla de creació de usuaris
        email_input = self.selenium.find_element_by_name('email')
        email_input.send_keys(usuari)
        self.selenium.find_element_by_xpath('//input[@value="Desar i continuar editant"]').click()
        self.selenium.find_element_by_xpath('//li[@class="success"]')


    def check_usuaris(self,usuaris,adminuser):
        # tornem a menu principal
        self.selenium.find_element_by_xpath('//a[@href="/admin/"]').click()
        # anem a menu usuaris
        self.selenium.find_element_by_xpath('//a[@href="/admin/core/user/"]').click()
        # check que hi son tots els alumnes
        for usuari in usuaris:
            self.selenium.find_element_by_xpath('//th[@class="field-username"]/a[text()="'+usuari+'"]')

    def check_no_usuaris(self,usuaris,adminuser):
        # tornem a menu principal
        self.selenium.find_element_by_xpath('//a[@href="/admin/"]').click()
        # anem a menu usuaris
        self.selenium.find_element_by_xpath('//a[@href="/admin/core/user/"]').click()
        # check que els alumnes llistats no hi són
        for usuari in usuaris:
            try:
                self.selenium.find_element_by_xpath('//th[@class="field-username"]/a[text()="'+usuari+'"]')
                raise Exception("Usuari '{}' veu usuari '{}' que no hauria de veure".format(adminuser,usuari))
            except NoSuchElementException:
                # si no el troba és que està OK
                pass

    def check_alumnes(self,alumnes,adminuser):
        # (1) check usuaris
        self.check_usuaris(alumnes,adminuser)
        # (2) check que tots els usuaris que es visualitzen a la llista son del centre
        usernames = self.selenium.find_elements_by_xpath('//th[@class="field-username"]/a')
        for username in usernames:
            # check que el user pertany al centre
            user = User.objects.get(username=username.text)
            if user.centre != adminuser.centre:
                raise Exception("L'alumne '{}' no pertany al centre de l'admin '{}'".format(username,adminuser))

    def check_items_admin_centre(self):
        # items de admin centre
        items = ['Ofertes','Titols','Categories','Centres','Usuaris']
        for item in items:
            self.selenium.find_element_by_xpath('//a[text()="'+item+'"]')
        # items que NO hi han de ser
        # TODO: activar (comentat per check ràpid)
        items = ['Cicles','Moduls Professionals','Python Social Auth','Grups']
        for item in items:
            try:
                self.selenium.find_element_by_xpath('//a[text()="'+item+'"]')
                # si trobem l'element prohibit, llancem excepció
                raise Exception("Usuari admin_centre no pot tenir ("+item+") al menu")
            except NoSuchElementException:
                # si no existeix l'element amb el find, ja és correcte
                pass
            except Exception as e:
                # si és qualsevol altre Excepcion, sí que la rellancem
                raise e

    def check_permisos_admin_centre(self):
        # anem al menu usuari
        self.selenium.find_element_by_xpath('//a[text()="Usuaris"]').click()
        # editem un usuari (admin1)
        self.selenium.find_element_by_xpath('//a[text()="'+self.username+'"]').click()
        # comprovar que a l'afegir usuari NO deixa editar super ni grups ni permisos
        for permis in self.permisos_only_super:
            try:
                elem = self.selenium.find_element_by_name(permis)
                if elem:
                    raise Exception("Usuari admin_centre no ha de poder gestionar permisos ("+permis+") al menu d'usuari")
            except NoSuchElementException:
                # si no existeix l'element amb el find, ja és correcte
                pass
            except Exception as e:
                # si és qualsevol altre Exception, sí que la rellancem
                raise e

    def crea_admin_centre(self,usuari,contrasenya):
        # afegim permisos admin centre
        self.backend_crea_usuari(usuari,contrasenya)
        # afegim grup
        self.selenium.find_element_by_xpath('//option[text()="admin_borsa"]').click()
        self.selenium.find_element_by_id('id_groups_add_link').click()
        # guardem
        self.selenium.find_element_by_xpath('//input[@value="Desar"]').click()
        # comprovem usuari creat OK
        self.selenium.find_element_by_xpath('//li[@class="success"]')

    def assigna_admin_a_centre(self,usuari,centre):
        self.ves_al_menu_principal()
        # anar a menu centres per assignar l'usuari al centre
        self.selenium.find_element_by_xpath('//a[@href="/admin/core/centre/"]').click()
        # cerca "centre"
        self.selenium.find_element_by_id("searchbar").send_keys(centre)
        self.selenium.find_element_by_xpath("//input[@value='Cerca']").click()
        # cliquem resultat
        self.selenium.find_element_by_xpath("//div[@class='results']//tr[@class='row1']//a").click()
        # assignem admin a l'usuari
        self.selenium.find_element_by_xpath('//option[text()="'+usuari+'"]').click()
        self.selenium.find_element_by_id('id_admins_add_link').click()
        # guardem
        self.selenium.find_element_by_xpath('//input[@value="Desar"]').click()
        self.selenium.find_element_by_xpath('//li[@class="success"]')




class CoreTest(BaseCoreTest,StaticLiveServerTestCase):
    @classmethod
    def setUpClass(cls):
        super().setUpClass()
        cls.selenium = WebDriver()
        cls.selenium.implicitly_wait(5)

    @classmethod
    def tearDownClass(cls):
        cls.selenium.quit()
        super().tearDownClass()

    # TESTS
    #############################################

    def test_superadmin(self):
        self.backend_login("admin@mail.com","enric123")
        # anem al menu usuari
        self.selenium.find_element_by_xpath('//a[text()="Usuaris"]').click()
        # editem un usuari (admin1)
        self.selenium.find_element_by_xpath('//a[text()="'+self.username+'"]').click()
        # comprovar que super pot editar tot dels usuaris
        for permis in self.permisos_only_super:
            elem = self.selenium.find_element_by_name(permis)
            if not elem:
                raise Exception("superadmin sí ha de poder gestionar permisos ("+permis+") al menu d'usuari")
        # sortim
        self.backend_logout()
        # TODO... superadmin pot veure tots els items d'altres menus

    def test_admin_centre(self):
        # ADMIN1
        self.backend_login("admin1@mail.com","enric123")
        self.check_items_admin_centre()
        self.check_permisos_admin_centre()
        # admin1 centre crea alumnes
        alumnes1 = ["alumne11@mail.com","alumne12@mail.com","alumne13@mail.com","alumne14@mail.com"]
        for alumne in alumnes1:
            self.backend_crea_usuari(alumne,"enric123")
        # admin1 pot veure els seus alumnes
        admin1 = User.objects.get(username="admin1@mail.com")
        self.check_alumnes(alumnes1,admin1)
        # logout
        self.backend_logout()

        # ADMIN2
        self.backend_login("admin2@mail.com","enric123")
        self.check_items_admin_centre()
        # admin2 centre crea alumnes
        self.backend_crea_usuari("alumne21@mail.com","enric123")
        self.backend_crea_usuari("alumne22@mail.com","enric123")
        # admin2 pot veure els seus alumnes
        admin2 = User.objects.get(username="admin2@mail.com")
        self.check_alumnes(["alumne21@mail.com","alumne22@mail.com"],admin2)
        # admin2 NO pot veure alumnes del admin1
        self.check_no_usuaris(alumnes1,admin2)
        # logout
        self.backend_logout()

    def test_crea_admins_centre(self):
        # creem admins centre
        self.backend_login("admin@mail.com","enric123")
        self.crea_admin_centre("admin3@mail.com","enric123")
        self.crea_admin_centre("admin4@mail.com","enric123")
        self.assigna_admin_a_centre("admin3@mail.com","terradas")
        self.assigna_admin_a_centre("admin4@mail.com","montilivi")
        # logout
        self.backend_logout()
