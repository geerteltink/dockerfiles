FROM alpine:edge

MAINTAINER Geert Eltink <@xtreamwayz>
LABEL repository.hub="xtreamwayz/php:5" \
      repository.url="https://github.com/xtreamwayz/dckr-stack/tree/master/php/5.6"

RUN \
  apk add --update \
    curl \
    git \
    ssmtp \

  && addgroup -g 82 -S www-data \
  && adduser -u 82 -S -D -h /var/cache/www-data -s /sbin/nologin -G www-data www-data

RUN \
  # Install packages
  apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
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
    php5-sockets \
    php5-xml \
    php5-xmlreader \
    php5-zip \
    php5-zlib \

  # Cleanup
  && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

COPY php.ini /etc/php5/conf.d/50-setting.ini
COPY php-fpm.conf /etc/php5/php-fpm.conf
COPY ssmtp.conf /etc/ssmtp/ssmtp.conf

RUN \
  # Create a symlink
  ln -sf /usr/bin/php5 /usr/bin/php \

  # Display some debug output
  && php --version && php -m \

  # Install composer
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \

  # Use https and add composer parallel install plugin
  && composer config --global repo.packagist composer https://packagist.org \
  && composer global require hirak/prestissimo --no-ansi \

  # Cleanup
  && rm -rf /root/.composer/cache/*

WORKDIR /app
EXPOSE 9000

CMD ["php-fpm", "-F"]
