#!/bin/bash

# set some permissions on folders
mkdir -p /srv/selection-tool/bsviewer/collected_static && chmod 775 /srv/selection-tool/bsviewer/collected_static
mkdir -p /srv/selection-tool/bsviewer/media && chmod 777 /srv/selection-tool/bsviewer/media
mkdir -p /var/log/django && chmod 777 /var/log/django && touch /var/log/django/bsviewer.log && chown uwsgi /var/log/django/bsviewer.log

exec "$@"
