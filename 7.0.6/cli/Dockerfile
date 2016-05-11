FROM php:7.0.6-cli

RUN apt-get update && apt-get install -y \
		zlib1g-dev \
 	--no-install-recommends

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

RUN rm -r /var/lib/apt/lists/*

WORKDIR /app

CMD ["php", "-a"]
