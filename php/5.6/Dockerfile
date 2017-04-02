FROM alpine:latest

MAINTAINER Geert Eltink <@xtreamwayz>
LABEL repository.hub="xtreamwayz/php:5" \
      repository.url="https://github.com/xtreamwayz/dckr-stack/tree/master/php/5.6"

RUN \
  # Install packages
  apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    curl \
    git \
    ssmtp \
    php5 \
    php5-common \
    php5-fpm \
    php5-bcmath \
    php5-curl \
    php5-ctype \
    php5-dom \
    php5-gd \
    php5-iconv \
    php5-intl \
    php5-json \
    php5-mysql \
    php5-mysqli \
    php5-opcache \
    php5-openssl \
    php5-pcntl \
    php5-pdo \
    php5-pdo_mysql \
    php5-pdo_sqlite \
    php5-phar \
    php5-redis \
    php5-sockets \
    php5-xdebug \
    php5-xml \
    php5-xmlreader \
    php5-zip \
    php5-zlib \

  # Cleanup
  && rm -rf \
    /var/cache/apk/* \
    /usr/share/doc \
    /usr/share/man \

  # Add PHP user
  && addgroup -g 1000 -S www-data \
  && adduser -u 1000 -D -S -G www-data www-data

COPY php.ini /etc/php5/conf.d/50-setting.ini
COPY php-fpm.conf /etc/php5/php-fpm.conf
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

CMD ["php-fpm", "-F"]
