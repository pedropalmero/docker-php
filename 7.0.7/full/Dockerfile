FROM php:7.0.7-fpm

RUN apt-get update && apt-get install -y \
		zlib1g-dev \
		libicu-dev \
		ca-certificates \
 	--no-install-recommends

RUN docker-php-ext-configure intl
RUN docker-php-ext-install mbstring zip pdo pdo_mysql bcmath intl sockets

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

RUN docker-php-ext-install mbstring zip pdo pdo_mysql bcmath

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


# Nginx

ENV NGINX_VERSION 1.10.1-1~jessie

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						nginx=${NGINX_VERSION} \
						nginx-module-xslt \
						nginx-module-geoip \
						nginx-module-image-filter \
						nginx-module-perl \
						nginx-module-njs \
						gettext-base

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

RUN rm -r /var/lib/apt/lists/*

WORKDIR /app

EXPOSE 80 443

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
