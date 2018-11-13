FROM php:7.2-fpm
MAINTAINER doozz

#  设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y \
        git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libmagickwand-dev \
        libmagickcore-dev \
        g++ \
        && docker-php-ext-install -j$(nproc) iconv mcrypt \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install -j$(nproc) gd \
        && docker-php-ext-install zip \
        && docker-php-ext-install pdo_mysql \
        && docker-php-ext-install opcache \
        && docker-php-ext-install mysqli \
        && docker-php-ext-install -j$(nproc) zip \
        && docker-php-ext-configure -j$(nproc) intl \
        && docker-php-ext-install -j$(nproc) intl
        && rm -r /var/lib/apt/lists/*

# 安装yaf,redis扩长
RUN curl -fsSL 'http://pecl.php.net/get/yaf-3.0.5.tgz' -o yaf-3.0.5.tgz \
    && mkdir -p /tmp/yaf \
    && tar -zxvf yaf-3.0.5.tgz -C /tmp/yaf --strip-components=1 \
    && rm yaf-3.0.5.tgz \
    && docker-php-ext-configure /tmp/yaf --enable-yaf \
    && docker-php-ext-install /tmp/yaf \
    && rm -r /tmp/yaf \

    && curl -fsSL 'http://pecl.php.net/get/yac-2.0.2.tgz' -o yac-2.0.2.tgz \
    && mkdir -p /tmp/yac \
    && tar -zxvf yac-2.0.2.tgz -C /tmp/yac --strip-components=1 \
    && rm yac-2.0.2.tgz \
    && docker-php-ext-configure /tmp/yac --enable-yac \
    && docker-php-ext-install /tmp/yac \
    && rm -r /tmp/yac \

    && curl -fsSL 'http://pecl.php.net/get/redis-3.1.4.tgz' -o redis-3.1.4.tgz \
    && mkdir -p /tmp/redis \
    && tar -zxvf redis-3.1.4.tgz -C /tmp/redis --strip-components=1 \
    && rm redis-3.1.4.tgz \
    && docker-php-ext-configure /tmp/redis --enable-redis \
    && docker-php-ext-install /tmp/redis \
    && rm -r /tmp/redis \
