# global
# crear random SECRET_KEY
SECRET_KEY = 'o(#%baw0jmayi2szr^gww5d09#aalru258l7^tkn)g+=(w3nhr'
ALLOWED_HOSTS = ['*']
DEBUG = True

# set2 example
EMAIL_HOST = "mail.mydomain.com"
EMAIL_PORT = "993"
EMAIL_FROM_NAME = "Borsa de Treball IETI (noreply)"
EMAIL_HOST_USER = "borsa@ieti.cat"
EMAIL_HOST_PASSWORD = "borsa123"
EMAIL_USE_TLS = True
EMAIL_USE_SSL = False

# plugins
TINYMCE_KEY='510hwwlt9nmelcz94ts716buw9vdnc2k1b9px05b6oa2bs2h'

#OAuth
SOCIAL_AUTH_URL_NAMESPACE = ""
SOCIAL_AUTH_LOGIN_REDIRECT_URL = "/"
SOCIAL_AUTH_GOOGLE_OAUTH2_KEY = "Clave_que_recibimos_de_Google"
SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET = "Clave_secreta_que_recibimos_de_Google"
# Microsoft no hi es en aquest plugin
# per crear Microsoft app:
# https://docs.microsoft.com/en-us/dynamics365/customer-engagement/portals/configure-oauth2-settings
#SOCIAL_AUTH_MICROSOFT_OAUTH2_KEY = "Clave que recibimos de Microsoft"
#SOCIAL_AUTH_MICROSOFT_OAUTH2_SECRET = "Clave secreta de Microsoft"

# DB
DB_TYPE = "mysql" # postgre, mysql
DB_HOST = "localhost"
DB_PORT = None # None = auto
DB_NAME = "borsa"
DB_USER = "borsa"
DB_PASS = "borsa123"




