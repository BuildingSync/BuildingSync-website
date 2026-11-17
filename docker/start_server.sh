#!/bin/bash

cd /srv/buildingsync-website

echo "Waiting for postgres to start"
/usr/local/wait-for-it.sh --strict db-postgres:5432

# Run any migrations before starting -- always for now
./manage.py migrate
./manage.py collectstatic --noinput

# On a new database, import the default schema version (settings.DEFAULT_SCHEMA_VERSION).
# This is a no-op when that version already exists.
# BEDES mappings are not loaded here because mapping CSVs contain database-specific IDs.
# To generate mappings for this database and load them, run:
# ./manage.py bedes --schema_version=2.7.0 --bedes_version=v2.5
# ./manage.py bedes --schema_version=2.7.0 --bedes_version=v2.5 --save_to_db
./manage.py reset_schema

# Create the default user based on the env vars
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('${BUILDINGSYNC_WEBSITE_ADMIN_USER}', '${BUILDINGSYNC_WEBSITE_ADMIN_EMAIL}', '${BUILDINGSYNC_WEBSITE_ADMIN_PASSWORD}')" | python manage.py shell

WORKERS=$(($(nproc) / 2))
WORKERS=$(($WORKERS>1?$WORKERS:1))

/usr/bin/uwsgi --ini /srv/buildingsync-website/docker/uwsgi.ini
