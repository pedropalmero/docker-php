FROM php:7.1-cli

RUN apt-get update && apt-get install -y \
		zlib1g-dev \
		libicu-dev \
		libxml2-dev \
 	--no-install-recommends

RUN docker-php-ext-configure intl
RUN docker-php-ext-install soap mbstring zip pdo pdo_mysql bcmath intl sockets

# Newrelic
RUN curl https://download.newrelic.com/548C16BF.gpg | apt-key add -
RUN echo "deb http://apt.newrelic.com/debian/ newrelic non-free" > /etc/apt/sources.list.d/newrelic.list
RUN apt-get update && apt-get install -y \
		newrelic-php5 \
		python-setuptools \
 	--no-install-recommends
ENV NR_INSTALL_PHPLIST /usr/local/bin
ENV NR_INSTALL_SILENT 1
RUN newrelic-install install

# GD 
RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libmcrypt-dev \
		libpng12-dev \
	--no-install-recommends
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

RUN echo "date.timezone = UTC" > /usr/local/etc/php/conf.d/date.timezone.ini

COPY Thawte_Premium_Server_CA.pem /usr/local/share/ca-certificates/Thawte_Premium_Server_CA.crt
RUN update-ca-certificates

RUN rm -r /var/lib/apt/lists/*

WORKDIR /app

CMD ["php", "-a"]
