FROM joserobleda/php:5.6-cli

RUN apt-get update && apt-get install -y python-setuptools

RUN easy_install supervisor

COPY ./supervisord-start /usr/bin/supervisord-start

CMD supervisord-start
