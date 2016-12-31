FROM php:5.6.26-fpm
RUN apt-get update
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        php5-mysql \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mysql mysqli

RUN apt-get install -y libmemcached-dev librabbitmq-dev \
    && pecl install memcached redis-2.2.8 amqp-1.6.0 \
    && docker-php-ext-enable memcached redis amqp