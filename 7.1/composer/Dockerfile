FROM composer/composer:1.2

RUN apt-get update && apt-get install && apt-get install -y zlib1g-dev libicu-dev g++ libxml2-dev

RUN docker-php-ext-configure intl

RUN docker-php-ext-install soap mbstring zip pdo pdo_mysql bcmath intl sockets

RUN echo "date.timezone = UTC" > /usr/local/etc/php/conf.d/date.timezone.ini

RUN composer --version
