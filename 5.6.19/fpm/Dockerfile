FROM php:5.6.19-fpm

# Dep libs
RUN apt-get update && apt-get install -y zlib1g-dev

# Newrelic sources
# RUN curl https://download.newrelic.com/548C16BF.gpg | apt-key add -
# RUN echo "deb http://apt.newrelic.com/debian/ newrelic non-free" > /etc/apt/sources.list.d/newrelic.list
# RUN apt-get update && apt-get install -yq newrelic-php5 python-setuptools
# RUN NR_INSTALL_PHPLIST=/usr/local/bin newrelic-install install

# Imagick
RUN apt-get update && apt-get install -y libmagickwand-dev
RUN pecl install imagick
RUN docker-php-ext-enable imagick

# GD 
RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

# Other extensions
RUN docker-php-ext-install mbstring zip pdo pdo_mysql bcmath

RUN echo "date.timezone = UTC" > /usr/local/etc/php/conf.d/date.timezone.ini

WORKDIR /app

EXPOSE 9000

CMD ["php-fpm"]
