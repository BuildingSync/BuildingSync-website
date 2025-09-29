#!/bin/bash

# Set PATH for cron compatibility - cron has a very limited PATH, .local contains AWS CLI
export PATH="/usr/local/bin:/home/ubuntu/.local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"

# This backup script creates nightly database and media file backups of the BuildingSync website when running
# in a docker container. The name of the container running the database is hardcoded to look for
# *db-postgres*. This may cause an issue if several docker applications are running on the same
# system. Also, the location of the backups is hardcoded to ~/buildingsync-website-backups.

# To create nightly backups, add the following to your crontab
# 0 0 * * * /srv/buildingsync-website/backup_database.sh <db_name> <db_username> >> /home/ubuntu/buildingsync-website-backups/cron.log 2>&1

# Test with the crontab entry -- should run every minute
# * * * * * /srv/buildingsync-website/backup_database.sh  buildingsync-website buildingsync-website >> /home/ubuntu/buildingsync-website-backups/cron.log 2>&1

# Source environment variables if the file exists, will read in s3_bucket and PWs as needed
if [ -f /etc/profile.d/buildingsync.sh ]; then
    source /etc/profile.d/buildingsync.sh
fi

DB_NAME=$1
DB_USERNAME=$2
S3_BUCKET=${S3_BUCKET:-"nrel-aws-buildings-backups"}

if [[ (-z ${DB_NAME}) || (-z ${DB_USERNAME}) ]] ; then
    echo "Expecting command to be of form ./backup_database.sh <db_name> <db_username>"
    exit 1
fi

if [ -z ${S3_BUCKET} ]; then
    echo "S3_BUCKET is not set"
    echo "[ERROR]-S3_BUCKET-not-configured"
    exit 1
fi

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed or not in PATH"
    echo "[ERROR]-AWS-CLI-not-found"
    echo "To install AWS CLI:"
    echo "  curl 'https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip' -o 'awscliv2.zip'"
    echo "  unzip awscliv2.zip"
    echo "  sudo ./aws/install"
    exit 1
fi

# currently the backup directory is hard coded
BACKUP_DIR=/home/ubuntu/buildingsync-website-backups
mkdir -p ${BACKUP_DIR}

# get the run date to save as the s3 folder name
RUN_DATE=$(date +%Y-%m-%d)

function file_name(){
    echo ${BACKUP_DIR}/${DB_NAME}_$(date '+%Y%m%d_%H%M%S').dump
}

function media_file_name(){
    echo ${BACKUP_DIR}/${DB_NAME}_media_$(date '+%Y%m%d_%H%M%S').tgz
}

# db_password is set from the environment variables in docker-compose. The docker stack must
# be running for this command to work.
echo "docker exec $(docker ps -f "name=buildingsync-website-db-postgres-1" --format "{{.ID}}") pg_dump -U ${DB_USERNAME} -Fc ${DB_NAME} > $(file_name)"
docker exec $(docker ps -f "name=buildingsync-website-db-postgres-1" --format "{{.ID}}") pg_dump -U ${DB_USERNAME} -Fc ${DB_NAME} > $(file_name)

# Backup the media directory (uploads, especially buildingsync). In docker-land this is
# just a container volume, so create a new container with the volume attached and tar it up.
MEDIA_BACKUP_FILE=$(media_file_name)
MEDIA_BACKUP_BASENAME=$(basename "$MEDIA_BACKUP_FILE")
# Run as the current user to avoid ownership issues, ubuntu:ubuntu
CURRENT_UID=$(id -u)
CURRENT_GID=$(id -g)
echo "docker run --rm --user $CURRENT_UID:$CURRENT_GID -v buildingsync_media:/backup/media -v $BACKUP_DIR:/backup/dir/ alpine:3.19 tar zcvf /backup/dir/$MEDIA_BACKUP_BASENAME /backup/media"
docker run --rm --user $CURRENT_UID:$CURRENT_GID -v buildingsync_media:/backup/media -v $BACKUP_DIR:/backup/dir/ alpine:3.19 tar zcvf /backup/dir/$MEDIA_BACKUP_BASENAME /backup/media

# Delete files older than 30 days.
find ${BACKUP_DIR} -mtime +30 -type f -name '*.dump' -delete
find ${BACKUP_DIR} -mtime +30 -type f -name '*.tgz' -delete

# upload to s3
for file in "$BACKUP_DIR"/*.dump
do
  echo "Backing up $file to $S3_BUCKET/buildingsync-website/$RUN_DATE/"
  if [ ! -s "$file" ]; then
    # the file is empty, send an error
    echo "[ERROR]-PostgreSQL-backup-file-was-empty-or-missing"
  else
    # can't pass spaces to slack notifications, for now
    aws s3 cp "$file" "s3://$S3_BUCKET/buildingsync-website/$RUN_DATE/"
    echo "[SUCCESS]-PostgreSQL-uploaded-to-s3://$S3_BUCKET/buildingsync-website/$RUN_DATE/$(basename "$file")"
  fi
done

for file in "$BACKUP_DIR"/*.tgz
do
  echo "Backing up $file to $S3_BUCKET/buildingsync-website/$RUN_DATE/"

  if [ ! -s "$file" ]; then
    # the file is empty, send an error
    echo "[ERROR]-Mediadata-backup-file-was-empty-or-missing"
  else
    # can't pass spaces to slack notifications, for now
    aws s3 cp "$file" "s3://$S3_BUCKET/buildingsync-website/$RUN_DATE/"
    echo "[SUCCESS]-Mediadata-uploaded-to-s3://$S3_BUCKET/buildingsync-website/$RUN_DATE/$(basename "$file")"
  fi
done