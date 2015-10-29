FROM php:5.6-cli

RUN apt-get update && apt-get install && apt-get install zlib1g-dev 

RUN docker-php-ext-install mbstring zip

RUN echo "date.timezone = UTC" > /usr/local/etc/php/conf.d/date.timezone.ini

ENTRYPOINT ["php"]
