#!/bin/bash

# set some permissions on folders
mkdir -p /srv/bs-tool/static && chmod 775 /srv/bs-tool/static
mkdir -p /srv/bs-tool/staticfiles && chmod 775 /srv/bs-tool/staticfiles
mkdir -p /srv/bs-tool/media && chmod 777 /srv/bs-tool/media
mkdir -p /srv/bs-tool/media/standard211 && chmod 777 /srv/bs-tool/media/standard211

exec "$@"
