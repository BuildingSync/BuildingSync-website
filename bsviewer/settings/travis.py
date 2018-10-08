"""
settings for travis (travis-ci.org)
"""
from __future__ import absolute_import

import os

from bsviewer.settings.dev import *  # noqa

# postgres DB config
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'bs_validator',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}

DEBUG = True

INTERNAL_IPS = ('127.0.0.1',)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'console': {
            'level': 'ERROR',
            'class': 'logging.StreamHandler'
        },
        'console-debug': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler'
        },
    },
    'loggers': {
        'django': {
            'handlers': ['console'],
            'level': os.getenv('DJANGO_LOG_LEVEL', 'DEBUG'),
        },
        'django.db.backends': {
            'level': 'INFO',
            'handlers': ['console-debug']
        },
    },
}

DEFAULT_SCHEMA_VERSION = '0.3.0'
