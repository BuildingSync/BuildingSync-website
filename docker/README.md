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
