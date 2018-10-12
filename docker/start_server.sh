#!/bin/bash

cd /srv/selection-tool

echo "Waiting for postgres to start"
/usr/local/wait-for-it.sh --strict db-postgres:5432

# Run any migrations before starting -- always for now
./manage.py migrate
./manage.py collectstatic --noinput

# Check if a schema has been imports
./manage.py reset_schema --schema_version 0.3.0
./manage.py bedes --save_to_db

# Create the default user based on the env vars
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('${SELECTION_TOOL_ADMIN_USER}', '${SELECTION_TOOL_ADMIN_EMAIL}', '${SELECTION_TOOL_ADMIN_PASSWORD}')" | python manage.py shell

WORKERS=$(($(nproc) / 2))
WORKERS=$(($WORKERS>1?$WORKERS:1))

/usr/bin/uwsgi --ini /srv/selection-tool/docker/uwsgi.ini
