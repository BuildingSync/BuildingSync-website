#!/bin/bash

cd /srv/buildingsync-website

echo "Waiting for postgres to start"
/usr/local/wait-for-it.sh --strict db-postgres:5432

# Run any migrations before starting -- always for now
./manage.py migrate
./manage.py collectstatic --noinput

# Check if a schema has been imported
./manage.py reset_schema --schema_version 1.0.0
./manage.py bedes --schema_version=1.0.0 --bedes_version=v2.2 --save_to_db

# Create the default user based on the env vars
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('${BUILDINGSYNC_WEBSITE_ADMIN_USER}', '${BUILDINGSYNC_WEBSITE_ADMIN_EMAIL}', '${BUILDINGSYNC_WEBSITE_ADMIN_PASSWORD}')" | python manage.py shell

WORKERS=$(($(nproc) / 2))
WORKERS=$(($WORKERS>1?$WORKERS:1))

/usr/bin/uwsgi --ini /srv/buildingsync-website/docker/uwsgi.ini
