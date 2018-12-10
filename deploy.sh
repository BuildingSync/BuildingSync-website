#!/bin/bash -e

# This script requires several environmental variables to be set to deploy. Note that if the
# users already exist in Postgres then they will not be recreated and their passwords
# will not be updated.

: << 'arguments'
POSTGRES_DB (optional), defaults to selection-tool
DJANGO_SETTINGS_MODULE (optional), defaults to config.settings.docker
POSTGRES_USER (required), admin user of postgres database
POSTGRES_PASSWORD (required), admin password for postgres database
SELECTION_TOOL_ADMIN_USER (required), admin user for BSYNC SELECTION TOOL
SELECTION_TOOL_ADMIN_PASSWORD (required), admin password for BSYNC SELECTION TOOL
SELECTION_TOOL_ADMIN_ORG (required), default organization for admin user in BSYNC SELECTION TOOL
SECRET_KEY (required), unique key for BSYNC SELECTION TOOL web application
# example (do not use these values in production).
export POSTGRES_USER=selection-tool
export POSTGRES_PASSWORD=super-secret-password
export SELECTION_TOOL_ADMIN_USER=admin@bsync.org
export SELECTION_TOOL_ADMIN_PASSWORD=super-secret-password
export SELECTION_TOOL_ADMIN_ORG=default
export SECRET_KEY=ARQV8qGuJKH8sGnBf6ZeEdJQRKLTUhsvEcp8qG9X9sCPXvGLhdxqnNXpZcy6HEyf
arguments

# Verify that env vars are set
if [ -z ${POSTGRES_USER+x} ]; then
    echo "POSTGRES_USER is not set"
    exit 1
fi

if [ -z ${POSTGRES_PASSWORD+x} ]; then
    echo "POSTGRES_PASSWORD is not set"
    exit 1
fi

if [ -z ${SELECTION_TOOL_ADMIN_USER+x} ]; then
    echo "SELECTION_TOOL_ADMIN_USER is not set"
    exit 1
fi

if [ -z ${SELECTION_TOOL_ADMIN_USER+x} ]; then
    echo "SELECTION_TOOL_ADMIN_USER is not set"
    exit 1
fi

if [ -z ${SELECTION_TOOL_ADMIN_PASSWORD+x} ]; then
    echo "SELECTION_TOOL_ADMIN_PASSWORD is not set"
    exit 1
fi

if [ -z ${SELECTION_TOOL_ADMIN_ORG+x} ]; then
    echo "SELECTION_TOOL_ADMIN_PASSWORD is not set"
    exit 1
fi

if [ -z ${SECRET_KEY+x} ]; then
    echo "SECRET_KEY is not set"
    exit 1
fi

if docker exec $(docker ps -qf "name=registry") true > /dev/null 2>&1; then
    echo "Registry is already running"
else
    echo "Creating registry"
    docker volume create --name=pgdata
    docker volume create --name=mediadata
    docker service create --name registry --publish 5000:5000 --mount type=volume,source=regdata,destination=/var/lib/registry registry:2.6
fi

if docker node ls > /dev/null 2>&1; then
  echo "Swarm already initialized"
else
  docker swarm init
fi

echo "Building latest version of BSYNC SELECTION TOOL"
docker-compose build --pull

echo "Tagging local containers"
docker tag buildingsync/selection-tool:latest 127.0.0.1:5000/selection-tool
docker tag postgres:latest 127.0.0.1:5000/postgres
docker tag redis:latest 127.0.0.1:5000/redis

sleep 3
echo "Pushing tagged versions to local registry"
docker push 127.0.0.1:5000/selection-tool
docker push 127.0.0.1:5000/postgres
docker push 127.0.0.1:5000/redis

echo "Deploying"
# check if the stack is running, and if so then shut it down
docker stack deploy selection-tool --compose-file=docker-compose.local.yml &
wait $!
while ( nc -zv 127.0.0.1 80 3>&1 1>&2- 2>&3- ) | awk -F ":" '$3 != " Connection refused" {exit 1}'; do echo -n "."; sleep 5; done
echo 'BSYNC SELECTION TOOL stack redeployed'

echo "Waiting for webserver to respond"
until curl -sf --output /dev/null "127.0.0.1"; do echo -n "."; sleep 1; done