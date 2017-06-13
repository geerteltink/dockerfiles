FROM alpine:latest

LABEL repository.hub="xtreamwayz/php:latest" \
      repository.url="https://github.com/xtreamwayz/dckr-stack/tree/master/php/7.1"

ARG PHP_INI_DIR=/etc/php
ARG PHP_BRANCH=PHP-7.1
ARG LIBICONV_VERSION=1.15
ARG XDEBUG_TAG=XDEBUG_2_5_4
ARG REDIS_TAG=3.1.2

RUN \
  apk add --update \
    git \
    ssmtp \
    tini \

  && addgroup -g 82 -S www-data \
  && adduser -u 82 -S -D -h /var/cache/www-data -s /sbin/nologin -G www-data www-data

RUN \
  apk add --virtual .php-build-dependencies \
    autoconf \
    binutils \
    bison \
    bzip2-dev \
    curl-dev \
    file \
    freetype-dev \
    g++ \
    gcc \
    icu-dev \
    jpeg-dev \
    libevent-dev \
    libmcrypt-dev \
    libpng-dev \
    libtool \
    libwebp-dev \
    libxml2-dev \
    libxslt-dev \
    make \
    postgresql-dev \
    re2c \
    readline-dev \
    sqlite-dev \
  && apk add --virtual .php-runtime-dependencies \
    curl \
    freetype \
    icu \
    jpeg \
    libbz2 \
    libevent \
    libltdl \
    libmcrypt \
    libpng \
    libpq \
    libwebp \
    libxml2 \
    libxslt \
    readline \
    zlib \

  # See: https://github.com/docker-library/php/issues/272
  && export CFLAGS="-O2 -march=native -fstack-protector-strong -fpic -fpie" \
  && export CPPFLAGS=${CFLAGS} \
  && export LDFLAGS="-Wl,-O2 -Wl,--hash-style=both -pie" \
  # Use multi-threaded 'make' by default
  && export MAKEFLAGS="-j $(expr $(getconf _NPROCESSORS_ONLN) \+ 1)" \

  # Proper iconv
  && LIBICONV_SOURCE="https://ftp.gnu.org/pub/gnu/libiconv/libiconv-${LIBICONV_VERSION}.tar.gz" \
  && curl -fSL --connect-timeout 30 ${LIBICONV_SOURCE} | tar xz -C /tmp \
  && cd /tmp/libiconv-${LIBICONV_VERSION} \

  && ./configure \
    --prefix=/usr \
  && make \
  && make install \

  # PHP
  && git clone -b ${PHP_BRANCH} --depth 1 https://github.com/php/php-src.git /tmp/php-src \
  && cd /tmp/php-src \

  && ./buildconf --force \
  && ./configure \
    --prefix=/usr \
    --sysconfdir=${PHP_INI_DIR} \
    --with-config-file-path=${PHP_INI_DIR} \
    --with-config-file-scan-dir=${PHP_INI_DIR}/conf.d \
    --without-pear \
    --disable-cgi \
    --disable-debug \
    --disable-ipv6 \
    --disable-phpdbg \
    --disable-rpath \
    --disable-static \
    --enable-bcmath \
    --enable-calendar \
    --enable-dom \
    --enable-exif \
    --enable-fd-setsize=$(ulimit -n) \
    --enable-fpm \
      --with-fpm-group=www-data \
      --with-fpm-user=www-data \
    --enable-ftp \
    --enable-inline-optimization \
    --enable-intl \
    --enable-json \
    --enable-libxml \
      --with-libxml-dir=/usr \
    --enable-mbregex \
    --enable-mbstring \
    --enable-opcache \
      --enable-huge-code-pages \
      --enable-opcache-file \
    --enable-pcntl \
    --enable-phar \
    --enable-session \
    --enable-shmop \
    --enable-soap \
    --enable-sockets \
    --enable-xml \
    --enable-xmlreader \
    --enable-xmlwriter \
    --enable-zip \
    --with-bz2=/usr \
    --with-curl \
    --with-gd \
      --with-freetype-dir=/usr \
      --with-jpeg-dir=/usr \
      --with-png-dir=/usr \
      --with-webp-dir=/usr \
      --with-zlib-dir=/usr \
    --with-iconv=/usr \
    --with-mhash \
    --with-mysqli \
    --with-openssl \
    --with-pcre-regex \
      --with-pcre-jit \
    --with-pdo-mysql=mysqlnd \
    --with-pdo-pgsql \
    --with-pdo-sqlite \
    --with-pgsql \
    --with-readline \
    --with-xmlrpc \
    --with-xsl \
  && make \
  && make install \

  # xDebug
  && git clone -o ${XDEBUG_TAG} --depth 1 https://github.com/xdebug/xdebug.git /tmp/xdebug \
  && cd /tmp/xdebug \
  && phpize \
  && ./configure \
  && make \
  && make install \

  # Redis
  && git clone -o ${REDIS_TAG} --depth 1 https://github.com/phpredis/phpredis.git /tmp/redis \
  && cd /tmp/redis \
  && phpize \
  && ./configure \
  && make \
  && make install \

  # Removing build dependencies, clean temporary files
  && apk del .php-build-dependencies \
  && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

COPY php-fpm.conf /etc/php/php-fpm.conf
COPY php.ini /etc/php/conf.d/php.ini

RUN \
  # Display some debug output
  php --version && php -m \

  # Install composer
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \

  # Use https
  && composer config --global repo.packagist composer https://packagist.org \

  # Add composer parallel install plugin
  && composer global require hirak/prestissimo --no-ansi

WORKDIR /app

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["php-fpm"]
