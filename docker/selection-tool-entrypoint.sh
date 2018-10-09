#!/bin/bash

# set some permissions on folders
mkdir -p /srv/selection-tool/static && chmod 775 /srv/selection-tool/static
mkdir -p /srv/selection-tool/staticfiles && chmod 775 /srv/selection-tool/staticfiles
mkdir -p /srv/selection-tool/media && chmod 777 /srv/selection-tool/media
#mkdir -p /srv/selection-tool/media/standard211 && chmod 777 /srv/selection-tool/media/standard211

exec "$@"
