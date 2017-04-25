FROM alpine:edge

MAINTAINER Geert Eltink <@xtreamwayz>
LABEL repository.hub="xtreamwayz/php:7" \
      repository.url="https://github.com/xtreamwayz/dckr-stack/tree/master/php/7.0"

RUN \
  # Install packages
  apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    curl \
    git \
    ssmtp \
    php7 \
    php7-common \
    php7-fpm \
    php7-bcmath \
    php7-curl \
    php7-ctype \
    php7-dom \
    php7-gd \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-mysqli \
    php7-opcache \
    php7-openssl \
    php7-pcntl \
    php7-pdo \
    php7-pdo_mysql \
    php7-pdo_sqlite \
    php7-phar \
    php7-session \
    php7-sockets \
    php7-xdebug \
    php7-xml \
    php7-xmlreader \
    php7-zip \
    php7-zlib \

  # Cleanup
  && rm -rf \
    /var/cache/apk/* \
    /usr/share/doc \
    /usr/share/man \

  # Add PHP user
  && addgroup -g 1000 -S www-data \
  && adduser -u 1000 -D -S -G www-data www-data

COPY php.ini /etc/php7/conf.d/50-setting.ini
COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY ssmtp.conf /etc/ssmtp/ssmtp.conf

RUN \
  # Display some debug output
  php --version && php -m \

  # Install composer
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \

  # Add composer parallel install plugin
  && composer global require hirak/prestissimo --no-ansi

WORKDIR /app
EXPOSE 9000

CMD ["php-fpm7", "-F"]
