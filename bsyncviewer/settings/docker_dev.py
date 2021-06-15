"""
Django settings for bsyncviewer project.

Generated by 'django-admin startproject' using Django 2.1.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.1/ref/settings/
"""

from bsyncviewer.settings.docker import *  # noqa: F401, F403

DEBUG = True

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
