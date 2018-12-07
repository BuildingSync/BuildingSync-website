#!/bin/bash

# set some permissions on folders
mkdir -p /srv/selection-tool/bsyncviewer/collected_static && chmod 775 /srv/selection-tool/bsyncviewer/collected_static
mkdir -p /srv/selection-tool/bsyncviewer/media && chmod 777 /srv/selection-tool/bsyncviewer/media
mkdir -p /var/log/django && chmod 777 /var/log/django && touch /var/log/django/bsyncviewer.log && chown uwsgi /var/log/django/bsyncviewer.log

exec "$@"
