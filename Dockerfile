# VERSION 0.1
# AUTHOR:           Nicholas Long <nicholas.long@nrel.gov>
# DESCRIPTION:      Dockerfile for running BuildingSync Data Selection Tool
# TO_BUILD_AND_RUN: docker-compose build && docker-compose up

# Latest Ubuntu LTS
FROM ubuntu:16.04

### Required dependencies
RUN apt-get update && apt-get install -y --no-install-recommends npm \
        nodejs \
        build-essential \
        git \
        python2.7 \
        python-pip \
        python-dev \
        python-gdbm \
        libpq-dev \
        libpcre3 \
        libpcre3-dev \
        enchant \
        vim \
    && pip install --upgrade pip \
    && pip install setuptools \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd --gid 1000 uwsgi \
    && useradd -g uwsgi -M -u 1000 -r uwsgi \
    && ln -s /usr/bin/nodejs /usr/bin/node \
    && mkdir -p /srv/bs-tool

### Note on some of the commands above
### create the uwsgi user and groud
### link the apt install of nodejs to node (expected by bower)
### Install python requirements

WORKDIR /srv/bs-tool
COPY requirements.txt /srv/bs-tool/requirements.txt
RUN pip install -r requirements.txt

### Install JavaScript requirements - do this first because they take awhile
### and the dependencies will probably change slower than python packages.
### README.md stops the no readme warning
COPY bower.json /srv/bs-tool/bower.json
COPY .bowerrc /srv/bs-tool/.bowerrc
COPY package.json /srv/bs-tool/package.json
COPY README.rst /srv/bs-tool/README.rst
RUN npm update && npm install
RUN $(npm bin)/bower install --config.interactive=false --allow-root

### Copy over the remaining part of the application and some helpers
COPY . /srv/bs-tool/

### Copy the wait-for-it command to /usr/local
COPY /docker/wait-for-it.sh /usr/local/wait-for-it.sh

RUN mkdir -p /srv/bs-tool/static && python manage.py collectstatic

# entrypoint sets some permissions on directories that may be shared volumes
COPY /docker/bstool-entrypoint.sh /usr/local/bin/bstool-entrypoint
RUN chmod 775 /usr/local/bin/bstool-entrypoint
ENTRYPOINT ["bstool-entrypoint"]

EXPOSE 8000
