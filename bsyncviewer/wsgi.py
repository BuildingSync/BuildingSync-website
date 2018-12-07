"""
WSGI config for bsyncviewer project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/howto/deployment/wsgi/
"""

import os
from os.path import abspath, dirname
from sys import path

from django.core.wsgi import get_wsgi_application

BASE_DIR = dirname(dirname(abspath(__file__)))
path.append(BASE_DIR)

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'bsyncviewer.settings')

application = get_wsgi_application()
