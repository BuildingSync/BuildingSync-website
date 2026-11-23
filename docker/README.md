# Running Docker and Docker Compose Locally

For testing docker locally run the following. It is not recommended using the environment variables
below on production, only for testing locally.

- Check out the source code to `/srv/BuildingSync-website`
- To test locally use:

  ```bash
  docker-compose build
  docker-compose up
  ```

- Starting over - one line

  `docker-compose stop && docker-compose rm -f && docker-compose build && docker volume rm pgdata && docker volume rm mediadata && docker volume create --name=buildingsync_pgdata && docker volume create --name=buildingsync_media && docker-compose up`

# Deploying with Docker and Docker Compose on Remote Server

- Check out the source code to `/srv/BuildingSync-website`
- Create new secret key from [here](http://www.miniwebtool.com/django-secret-key-generator/).
- Set environment variables that will be passed to docker in /etc/profile.d/buildingsync.sh

  ```bash
  export POSTGRES_USER=buildingsync-website
  export POSTGRES_PASSWORD=super-secret-password
  export BUILDINGSYNC_WEBSITE_ADMIN_USER=admin
  export BUILDINGSYNC_WEBSITE_ADMIN_PASSWORD=super-secret-password
  export BUILDINGSYNC_WEBSITE_ADMIN_EMAIL=admin@buildingsync.net
  export SECRET_KEY="Super-Long-Secret-Key-From-Step-Above"
  ```

- Build the containers and Deploy

  ```bash
  cd /srv/buildingsync-website/
  docker-compose -f docker-compose.prod.yml up -d --build
  ```

# Redeploying

- Log into the server

```bash
cd /srv/buildingsync-website/
git pull
docker-compose -f docker-compose.prod.yml up -d --build
```

# Upgrading PostgreSQL (11.1 to 17)

The database image moved from `postgres:11.1` to `postgres:17`. Django 5.2 requires
PostgreSQL 14 or newer, so this upgrade has to land before the Django upgrade.
PostgreSQL 17 is supported upstream until November 2029.

A major-version upgrade cannot reuse the existing data directory. If `postgres:17`
starts on the old `buildingsync_pgdata` volume, it exits right away with
`FATAL: database files are incompatible with server`. The data has to be dumped from
11.1 and restored into an empty volume. The steps below keep the volume name
`buildingsync_pgdata` (so the compose files and `backup_database.sh` don't change).
They also keep a copy of the 11.1 volume for rollback.

The image tag `postgres:17` follows 17.x minor releases. Minor upgrades reuse the volume:
`docker compose -f docker-compose.prod.yml pull db-postgres` then `up -d`.

## Production runbook

Expect a few minutes of downtime. The site is down from step 3 until step 8. Run all
commands on the server as `ubuntu`.

### 1. Prepare (site still up)

```bash
cd /srv/buildingsync-website
source /etc/profile.d/buildingsync.sh
export DC="docker compose -f docker-compose.prod.yml"
export DBC=buildingsync-website-db-postgres-1
export UPG=$HOME/buildingsync-website-backups/pg-upgrade
mkdir -p $UPG

# Confirm the current server version and container name
docker exec $DBC psql -U buildingsync-website -d buildingsync-website -Atc 'show server_version'   # 11.1 ...

# Check disk space: the rollback copy needs as much space as the current volume
docker run --rm -v buildingsync_pgdata:/d:ro alpine:3.19 du -sh /d
df -h /var/lib/docker

# Pull the new image ahead of time to shorten the downtime
docker pull postgres:17

# Row-count query used before and after the restore
cat > $UPG/rowcounts.sql <<'EOF'
SELECT table_name,
       (xpath('/row/c/text()',
              query_to_xml(format('SELECT count(*) AS c FROM %I.%I', table_schema, table_name), false, true, '')))[1]::text::bigint AS row_count
FROM information_schema.tables
WHERE table_schema = 'public' AND table_type = 'BASE TABLE'
  AND (table_name LIKE 'bsyncviewer\_%' OR table_name IN ('auth_user', 'django_migrations'))
ORDER BY table_name;
EOF
```

### 2. Back up

Run the nightly backup script by hand. It writes a `pg_dump -Fc` file and a media tarball
to `~/buildingsync-website-backups/<date>/` and syncs that folder to S3. This is the
off-host copy.

```bash
./backup_database.sh buildingsync-website buildingsync-website
```

Make sure it ends with `[SUCCESS]-Backup folder synced to s3://...` before you continue.

### 3. Stop the web container and take the final dump

Stop `web` first so nothing writes during the dump. Then dump from the old 11.1 container
and record the row counts.

```bash
$DC stop web

docker exec $DBC pg_dump -U buildingsync-website -Fc buildingsync-website > $UPG/buildingsync-website_pg11_final.dump
docker exec -i $DBC psql -U buildingsync-website -d buildingsync-website -At -F ' ' < $UPG/rowcounts.sql | tee $UPG/rowcounts_before.txt

# Sanity check: the archive is readable and came from 11.1
docker exec -i $DBC pg_restore -l < $UPG/buildingsync-website_pg11_final.dump | grep 'Dumped from'
```

### 4. Keep the 11.1 volume for rollback and create an empty volume

Docker can't rename volumes, so copy the old data into `buildingsync_pgdata_pg11` and
recreate `buildingsync_pgdata` empty. `down` removes the containers and network only.
External volumes are never removed, and `-v` must not be used.

```bash
$DC down

docker volume create buildingsync_pgdata_pg11
docker run --rm -v buildingsync_pgdata:/from:ro -v buildingsync_pgdata_pg11:/to alpine:3.19 \
  sh -c 'cp -a /from/. /to/ && cat /to/PG_VERSION && du -sh /to'    # prints 11 and the size

docker volume rm buildingsync_pgdata
docker volume create buildingsync_pgdata
```

### 5. Get the new compose file

```bash
git pull
grep 'image: postgres' docker-compose.prod.yml    # image: postgres:17
```

### 6. Start only the database on the new image

Don't start `web` yet. `docker/start_server.sh` runs `migrate`, `reset_schema` and
creates the admin user. On an empty database that would write rows that clash with the
restore. If `web` starts by accident, go back to the `docker volume rm` /
`docker volume create` lines in step 4 and repeat from there.

```bash
$DC up -d db-postgres

# -h localhost waits for the real server, not the image's temporary init server
until docker exec $DBC pg_isready -h localhost -U buildingsync-website -q; do sleep 1; done
docker exec $DBC psql -U buildingsync-website -d buildingsync-website -Atc 'show server_version'   # 17.x
```

### 7. Restore and analyze

The image has already created the empty `buildingsync-website` database owned by
`$POSTGRES_USER`. `pg_restore` doesn't carry planner statistics, so run `ANALYZE` after it.

```bash
docker exec -i $DBC pg_restore -U buildingsync-website -d buildingsync-website \
  --no-owner --exit-on-error < $UPG/buildingsync-website_pg11_final.dump
docker exec $DBC vacuumdb -U buildingsync-website -d buildingsync-website --analyze-only
```

### 8. Verify, then start the web container

```bash
docker exec -i $DBC psql -U buildingsync-website -d buildingsync-website -At -F ' ' < $UPG/rowcounts.sql > $UPG/rowcounts_after.txt
diff $UPG/rowcounts_before.txt $UPG/rowcounts_after.txt && echo "row counts match"
```

Go on only if `diff` prints nothing. Then start `web` **without `--build`**. This upgrade
changes only the database image, so the existing web image is reused.

```bash
$DC up -d web
$DC logs -f web     # Ctrl-C once uwsgi is up
```

Expected log lines: `No migrations to apply.` and
`Schema already exists in the database: <version>`. An
`IntegrityError ... Key (username)=(admin) already exists` traceback is normal on every
restart. `start_server.sh` always tries to create the admin user.

Smoke test:

```bash
for p in / /schema /validator /use_cases /admin/login/; do
  curl -s -o /dev/null -w "$p %{http_code}\n" http://localhost:8082$p
done
```

Then open <https://buildingsync.net>, view a schema release, validate an example file, and
log in to the admin. Finally, run `./backup_database.sh buildingsync-website buildingsync-website`
again to confirm the nightly backup works against 17. From now on, backups are dumps from
PostgreSQL 17 and need `pg_restore` 17 or newer to restore.

### 9. Rollback

Use this if any step from 6 onward fails, or if the site misbehaves on 17. Any data
written after step 8 (new users, uploaded use cases) is lost on rollback, so decide
go/no-go before you reopen the site, if you can.

```bash
$DC down
docker volume rm buildingsync_pgdata
docker volume create buildingsync_pgdata
docker run --rm -v buildingsync_pgdata_pg11:/from:ro -v buildingsync_pgdata:/to alpine:3.19 \
  sh -c 'cp -a /from/. /to/ && cat /to/PG_VERSION'    # prints 11

# Point compose back at the old image (or check out the previous release)
sed -i 's|image: postgres:17|image: postgres:11.1|' docker-compose.prod.yml
$DC up -d

until docker exec $DBC pg_isready -h localhost -U buildingsync-website -q; do sleep 1; done
docker exec -i $DBC psql -U buildingsync-website -d buildingsync-website -At -F ' ' < $UPG/rowcounts.sql | diff $UPG/rowcounts_before.txt - && echo "rollback row counts match"
```

If the `buildingsync_pgdata_pg11` copy is unusable, restore
`$UPG/buildingsync-website_pg11_final.dump` (or the step 2 backup from S3) into an empty
volume running `postgres:11.1`. Use the same restore command as in step 7.

### 10. Clean up

After the site has run cleanly on 17 for a week or so:

```bash
docker volume rm buildingsync_pgdata_pg11
rm -r $HOME/buildingsync-website-backups/pg-upgrade    # backup_database.sh does not prune this folder
```

## Local development volumes

Your local `buildingsync_pgdata` volume also holds 11.1 data. Choose one:

- Start over: `docker volume rm buildingsync_pgdata && docker volume create buildingsync_pgdata`.
  `start_server.sh` then reloads the default schema on the next `docker-compose up`.
- Keep the data: follow steps 3 to 8 with `docker compose -f docker-compose.yml` and
  `DBC=buildingsync-website-db-postgres-1`.

# Debugging

## Google Analytics

Production settings enable GA4 page-view tracking with Measurement ID `G-P8CNFE9GY2`.
Tracking is disabled when Django's `DEBUG` setting is true. The shared page layouts
include the tag; the Django admin does not.

To change or disable tracking, set `GOOGLE_ANALYTICS_MEASUREMENT_ID` in the web
container's environment. For example, add this entry under `web.environment` in
your Compose configuration to disable it:

```yaml
- GOOGLE_ANALYTICS_MEASUREMENT_ID=
```

Rebuild and redeploy to apply the template changes. Then visit the public site
with browser tracking blockers disabled and check GA4's Realtime report for the
visit. Data collection cannot be verified until the updated site is deployed.

The tag does not implement cookie consent. Confirm applicable consent and privacy
notice requirements before deploying; if consent is required, gate the tag on
consent before enabling collection.

## Container Logs

- Tail log

```bash
# obtain docker container id
docker ps

docker logs <-f> <container_id>
```
