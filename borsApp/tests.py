from django.test import TestCase
from django.db.utils import IntegrityError

# Create your tests here.


from borsApp.models import *

"""
class CicleTestCase(TestCase):
	TEST_CAT = "TEST CAT"
	TEST_CICLE_CODI = "TEST"
	TEST_CICLE_NOM = "CICLE TEST 1"

	def setUp(self):
		# creem dades d'exemple
		self.test_cat = Categoria.objects.create( nom=self.TEST_CAT,
										descripcio="CAT DESC bla bla" )
		self.test_cic = Cicle.objects.create( grau="CFGM",
										codi=self.TEST_CICLE_CODI,
										nom=self.TEST_CICLE_NOM,
										familia=self.test_cat)

	def test_existeix_cicle(self):
		cicle = Cicle.objects.filter( codi=self.TEST_CICLE_CODI )
		self.assertEqual( self.TEST_CICLE_NOM, cicle[0].nom )

	def duplica_cat(self):
		cat_dup = Categoria.objects.create( nom=self.TEST_CAT, descripcio="ble ble" )
	def duplica_cicle(self):
		cicle_dup = Cicle.objects.create( grau="CFGM",
										codi="TESTDUP",
										nom=self.TEST_CICLE_NOM,
										familia=self.test_cat)
	def test_cat_nom_unic(self):
		self.assertRaises( IntegrityError, self.duplica_cat )
	def test_cicle_nom_unic(self):
		self.assertRaises( IntegrityError, self.duplica_cicle )


	NO ens cal fer tearDown pq es destrueix sola la DB de test ;)
	def tearDown(self):
		self.test_cic.delete()
		self.test_cat.delete()
	"""

