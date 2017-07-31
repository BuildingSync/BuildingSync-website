#!/bin/bash

cd /srv/bs-tool

echo "Waiting for postgres to start"
/usr/local/wait-for-it.sh --strict db-postgres:5432

# Run any migrations before starting -- always for now
./manage.py migrate
#./manage.py create_default_user --username=$SEED_ADMIN_USER --password=$SEED_ADMIN_PASSWORD --organization=$SEED_ADMIN_ORG

WORKERS=$(($(nproc) / 2))
WORKERS=$(($WORKERS>1?$WORKERS:1))
/usr/local/bin/uwsgi --http 0.0.0.0:8000 --module wsgi \
    --max-requests 5000 --cheaper-initial 1 -p $WORKERS --single-interpreter --enable-threads \
    --wsgi-file /srv/bs-tool/main/wsgi.py
