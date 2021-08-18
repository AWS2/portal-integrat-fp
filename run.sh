#!/bin/bash

# comprova si calen migracions i les executa
python manage.py migrate

# recull arxius estàtics
# (no cal de moment pq fem servir servidor de test)
#python manage.py collectstatic

# posta en marxa
python manage.py runserver 0.0.0.0:8000

