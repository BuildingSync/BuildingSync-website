#!/bin/bash

# Make sure various folders exist before setting permissions
mkdir -p /srv/buildingsync-website/bsyncviewer/collected_static && chmod 775 /srv/buildingsync-website/bsyncviewer/collected_static
mkdir -p /srv/buildingsync-website/bsyncviewer/media/uploaded_schemas
mkdir -p /srv/buildingsync-website/bsyncviewer/media/usecase_mappings
mkdir -p /srv/buildingsync-website/bsyncviewer/media/usecase_templates

# Set the owner and permissions on the various folders
chown -R uwsgi.uwsgi /srv/buildingsync-website/bsyncviewer/media
find /srv/buildingsync-website/bsyncviewer/media -type f -exec chmod 664 {} \;
find /srv/buildingsync-website/bsyncviewer/media -type d -exec chmod 775 {} \;

# logging directories
mkdir -p /var/log/django && chmod 777 /var/log/django && touch /var/log/django/bsyncviewer.log && chown uwsgi /var/log/django/bsyncviewer.log

exec "$@"
