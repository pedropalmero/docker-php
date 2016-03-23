FROM php:7.0.4-fpm

RUN apt-get update && apt-get install && apt-get install -y zlib1g-dev

RUN docker-php-ext-install mbstring zip pdo pdo_mysql bcmath

# Newrelic
RUN curl https://download.newrelic.com/548C16BF.gpg | apt-key add -
RUN echo "deb http://apt.newrelic.com/debian/ newrelic non-free" > /etc/apt/sources.list.d/newrelic.list
RUN apt-get update && apt-get install -yq newrelic-php5 python-setuptools
ENV NR_INSTALL_PHPLIST /usr/local/bin
ENV NR_INSTALL_SILENT 1

RUN docker-php-ext-install mbstring zip pdo pdo_mysql bcmath

# GD 
RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

RUN echo "date.timezone = UTC" > /usr/local/etc/php/conf.d/date.timezone.ini

WORKDIR /app

EXPOSE 9000

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm"]
