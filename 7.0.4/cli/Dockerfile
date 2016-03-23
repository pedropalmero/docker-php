FROM php:7.0.4-cli

RUN apt-get update && apt-get install && apt-get install -y libpng12-dev zlib1g-dev

RUN docker-php-ext-install mbstring zip pdo pdo_mysql bcmath

# GD 
RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

RUN echo "date.timezone = UTC" > /usr/local/etc/php/conf.d/date.timezone.ini

WORKDIR /app

CMD ["php", "-a"]
