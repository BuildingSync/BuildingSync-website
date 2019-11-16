#!/bin/bash

# Make sure various folders exist before setting permissions
mkdir -p /srv/selection-tool/bsyncviewer/collected_static && chmod 775 /srv/selection-tool/bsyncviewer/collected_static
mkdir -p /srv/selection-tool/bsyncviewer/media/uploaded_schemas
mkdir -p /srv/selection-tool/bsyncviewer/media/usecase_mappings
mkdir -p /srv/selection-tool/bsyncviewer/media/usecase_templates

# Set the owner and permissions on the various folders
chown -R uwsgi.uwsgi /srv/selection-tool/bsyncviewer/media
find /srv/selection-tool/bsyncviewer/media -type f -exec chmod 664 {} \;
find /srv/selection-tool/bsyncviewer/media -type d -exec chmod 775 {} \;

# logging directories
mkdir -p /var/log/django && chmod 777 /var/log/django && touch /var/log/django/bsyncviewer.log && chown uwsgi /var/log/django/bsyncviewer.log

exec "$@"
