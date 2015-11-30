FROM php:5.6.15-cli

RUN apt-get update && apt-get install && apt-get install zlib1g-dev 

RUN docker-php-ext-install mbstring zip pdo pdo_mysql bcmath

RUN echo "date.timezone = UTC" > /usr/local/etc/php/conf.d/date.timezone.ini

WORKDIR /app

CMD ["php", "-a"]
