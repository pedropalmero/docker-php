FROM php:5.6.18-cli

RUN apt-get update && apt-get install && apt-get install -y libpng12-dev zlib1g-dev

RUN docker-php-ext-install gd mbstring zip pdo pdo_mysql bcmath

RUN echo "date.timezone = UTC" > /usr/local/etc/php/conf.d/date.timezone.ini

WORKDIR /app

CMD ["php", "-a"]
