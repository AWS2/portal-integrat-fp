#!/bin/bash

# comprova si calen migracions i les executa
#python manage.py migrate

# recull arxius estàtics
# (no cal de moment pq fem servir servidor de test)
#python manage.py collectstatic

# geckodriver in tests needs to have firefox opened before
#firefox &

# posta en marxa dels tests
python manage.py test

# do not close container
#firefox
