FROM python:3.6-alpine

LABEL maintainer="pan.luo@ubc.ca"

ENV BOT_DATA_DIR=/srv/data \
    BOT_EXTRA_PLUGIN_DIR=/srv/plugins

RUN apk add --no-cache git libldap \
   && apk add --no-cache --virtual .build-deps  \
   gcc \
   musl-dev \
   libffi-dev \
   libressl-dev \
   openldap-dev


WORKDIR /src

ADD requirements.txt /src/requirements.txt
ADD config.py /src/config.py
ADD docker-entrypoint.sh /docker-entrypoint.sh

RUN pip install --no-cache-dir --disable-pip-version-check -r requirements.txt \
      && apk del .build-deps

VOLUME ["/srv"]
EXPOSE 3141

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["errbot"]
