# VERSION 0.1
# AUTHOR:           Nicholas Long <nicholas.long@nrel.gov>
# DESCRIPTION:      Dockerfile for running BuildingSync Data Selection Tool
# TO_BUILD_AND_RUN: docker-compose build && docker-compose up
FROM alpine:3.8

RUN apk add --no-cache python3 \
        python3-dev \
        postgresql-dev \
        alpine-sdk \
        pcre \
        pcre-dev \
        libxslt-dev \
        linux-headers \
        bash \
        bash-completion && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache && \
    addgroup -g 1000 uwsgi && \
    adduser -G uwsgi -H -u 1000 -S uwsgi

### Note on some of the commands above:
###   - create the uwsgi user and group to have id of 1000
###   - copy over python3 as python and pip3 as pip

WORKDIR /srv/selection-tool
COPY /requirements.txt /srv/selection-tool/requirements.txt
RUN pip install -r requirements.txt

### Copy over the remaining part of the application and some helpers
COPY . /srv/selection-tool/

### Copy the wait-for-it command to /usr/local
COPY /docker/wait-for-it.sh /usr/local/wait-for-it.sh

# entrypoint sets some permissions on directories that may be shared volumes
COPY /docker/selection-tool-entrypoint.sh /usr/local/bin/selection-tool-entrypoint
RUN chmod 775 /usr/local/bin/selection-tool-entrypoint
ENTRYPOINT ["selection-tool-entrypoint"]

EXPOSE 8000
