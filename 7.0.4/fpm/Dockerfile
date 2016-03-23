FROM php:7.0.4-fpm

RUN apt-get update && apt-get install && apt-get install -y zlib1g-dev

RUN docker-php-ext-install mbstring zip pdo pdo_mysql bcmath

RUN echo "date.timezone = UTC" > /usr/local/etc/php/conf.d/date.timezone.ini

WORKDIR /app

EXPOSE 9000
CMD ["php-fpm"]
