# Running Docker and Docker Compose Locally

For testing docker locally run the following. It is not recommended using the environment variables
below on production, only for testing locally.

* Check out the source code to `/srv/selection-tool`
* Run 

```bash
docker-compose build
docker volume create --name=pgdata
docker volume create --name=mediadata
docker-compose up
```

Starting over - one line

`docker-compose stop && docker-compose rm -f && docker-compose build && docker volume rm pgdata && docker volume rm mediadata && docker volume create --name=pgdata && docker volume create --name=mediadata && docker-compose up`


# Deploying with Docker and Docker Compose on Remote Server

* Check out the source code to `/srv/selection-tool`
* Create new secret key from [here](http://www.miniwebtool.com/django-secret-key-generator/).
* Copy the config file
   
```bash
sudo cp /srv/selection-tool/docker-compose.docker.yml.template /srv/docker-compose.docker.yml
sudo chmod 600 /srv/docker-compose.docker.yml
```
* Set the various environment variables by editing the new /srv/docker-compose.docker.yml

    * Use new secret key from the step above
    * Create new passwords for the default user and postgresql
    
* Add systemd script by running

```bash
sudo systemctl enable /srv/selection-tool/docker/selectiontool.service
sudo service selectiontool status
```

*Note: If trying to run the commands locally, then you will need to export the env vars that are in the /srv/selection-tool-config.env file*

# Redeploying

* Log into the server

```bash
cd /srv/selection-tool
git pull
docker-compose build

sudo service selectiontool restart
```

# Debugging

* Tail log

```bash
journalctl -u selectiontool.service -f
```
