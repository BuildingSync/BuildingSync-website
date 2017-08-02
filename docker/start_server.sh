#!/bin/bash

cd /srv/bs-tool

echo "Waiting for postgres to start"
/usr/local/wait-for-it.sh --strict db-postgres:5432

# Run any migrations before starting -- always for now
./manage.py migrate

# Create the schema / right now everytime. # TODO: ensure idempotency
./manage.py create_schema

# Create the default user based on the env vars
./manage.py create_user $BSTOOL_ADMIN_USER $BSTOOL_ADMIN_EMAIL $BSTOOL_ADMIN_PASSWORD

WORKERS=$(($(nproc) / 2))
WORKERS=$(($WORKERS>1?$WORKERS:1))
/usr/local/bin/uwsgi --http 0.0.0.0:8000 --module wsgi --uid 1000 --gid 1000 \
    --max-requests 5000 --cheaper-initial 1 -p $WORKERS --single-interpreter --enable-threads \
    --wsgi-file /srv/bs-tool/main/wsgi.py
