# script per testejar ràpid sobre el live server
# abans d'executar-ho posar en marxa el server amb ./manage.py runserver en un altre terminal

from selenium.webdriver.firefox.webdriver import WebDriver

def login(usuari,contrasenya):
    # accedeix a URL
    selenium.get('%s%s' % ("http://localhost:8000", '/admin/login/'))
    username_input = selenium.find_element_by_name("username")
    username_input.send_keys(usuari)
    password_input = selenium.find_element_by_name("password")
    password_input.send_keys(contrasenya)
    selenium.find_element_by_xpath('//input[@value="Iniciar sessió"]').click()

def logout():
    selenium.find_element_by_xpath('//a[text()="Finalitzar sessió"]').click()

# aqui va la "chicha"
def test():
    # anar a menu principal
    selenium.find_element_by_xpath('//a[@href="/admin/"]').click()
    # afegim empresa
    selenium.find_element_by_xpath('//a[@href="/admin/borsApp/empresa/add/"]').click()
    selenium.find_element_by_name('nom').send_keys("empresaX")
    # accedir dins iframe direcció
    selenium.switch_to_frame("id_direccio_ifr")
    selenium.find_element_by_xpath('//body').send_keys("c. Tal, 1")
    # tornar al main frame
    selenium.switch_to_default_content()
    selenium.find_element_by_name('poblacio').send_keys("Cornellà")
    selenium.find_element_by_name('cp').send_keys("08940")
    selenium.find_element_by_name('telefon').send_keys("931112233")
    selenium.find_element_by_name('email').send_keys("info@empresaX.com")
    selenium.find_element_by_xpath('//input[@value="Desar"]').click()
    selenium.find_element_by_xpath('//li[@class="success"]')



# crea driver
selenium = WebDriver()
selenium.implicitly_wait(5)
# tests
try:
    login("admin1","enric123")
    test()
    logout()
    selenium.close()
except Exception as e:
    print("ERROR: "+str(e))
    selenium.close()
    raise e
