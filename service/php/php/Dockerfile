FROM php:7.2-fpm
MAINTAINER doozz

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libmagickwand-dev \
        libmagickcore-dev \
        g++ \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-configure -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) intl


RUN curl -fsSL 'http://pecl.php.net/get/redis-3.1.4.tgz' -o redis-3.1.4.tgz \
    && mkdir -p /tmp/redis \
    && tar -zxvf redis-3.1.4.tgz -C /tmp/redis --strip-components=1 \
    && rm redis-3.1.4.tgz \
    && docker-php-ext-configure /tmp/redis --enable-redis \
    && docker-php-ext-install /tmp/redis \
    && rm -r /tmp/redis \

    && curl -fsSL "https://codeload.github.com/phalcon/cphalcon/tar.gz/v3.4.0" | tar -xz \
    && cd cphalcon-$3.4.0/build \
    && ./install \
    && docker-php-ext-enable phalcon \
    && cd ../.. rm -r cphalcon-3.4.0


