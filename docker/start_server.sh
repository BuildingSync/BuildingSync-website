#!/bin/bash

cd /srv/selection-tool

echo "Waiting for postgres to start"
/usr/local/wait-for-it.sh --strict db-postgres:5432

# Run any migrations before starting -- always for now
./manage.py migrate
./manage.py collectstatic --noinput

# Check if a schema has been imports
./manage.py reset_schema --schema_version 0.3.0

# Create the default user based on the env vars
#./manage.py createsuperuser ${SELECTION_TOOL_ADMIN_USER} ${SELECTION_TOOL_ADMIN_EMAIL} ${SELECTION_TOOL_ADMIN_PASSWORD}

WORKERS=$(($(nproc) / 2))
WORKERS=$(($WORKERS>1?$WORKERS:1))

/usr/bin/uwsgi --ini /srv/selection-tool/docker/uwsgi.ini
