# Running Docker and Docker Compose Locally

For testing docker locally run the following. It is not recommended using the environment variables
below on production, only for testing locally.

* Check out the source code to `/srv/bs-tool`
* Run 

```bash
docker-compose build
docker volume create --name=pgdata
docker-compose up
```

Starting over - one line

`docker-compose stop && docker-compose rm -f && docker-compose build && docker volume rm pgdata && docker volume create --name=pgdata && docker-compose up`


# Deploying with Docker and Docker Compose on Remote Server

* Check out the source code to `/srv/bs-tool`
* Create new secret key from [here](http://www.miniwebtool.com/django-secret-key-generator/).
* Set the various environment variables

    * Copy the config.env.template file to the /srv/bs-tool/config.env
    * Edit the file to update the variables. Use new secret key from the step above.
    
* Add systemd script

```bash
sudo systemctl enable /srv/bs-tool/docker/selectiontool.service
sudo service selectiontool status
```

# Redeploying

* Log into the server

```bash
cd /srv/bs-tool
git pull
docker-compose build
sudo service selectiontool restart
```

# Debugging

* Tail log

```bash
journalctl -u selectiontool.service -f
```
