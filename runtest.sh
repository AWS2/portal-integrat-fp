#!/bin/bash

# comprova si calen migracions i les executa
#python manage.py migrate

# recull arxius estàtics
# (no cal de moment pq fem servir servidor de test)
#python manage.py collectstatic

firefox &

# posta en marxa
python manage.py test

# do not close container
#firefox
