FROM php:5.6-fpm

RUN apt-get update && apt-get install && apt-get install zlib1g-dev

RUN docker-php-ext-install mbstring zip pdo pdo_mysql bcmath

RUN echo "date.timezone = UTC" > /usr/local/etc/php/conf.d/date.timezone.ini

WORKDIR /var/app/current

EXPOSE 9000
CMD ["php-fpm"]
