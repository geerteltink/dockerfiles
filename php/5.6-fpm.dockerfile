FROM alpine:edge

RUN \
  apk add --update \
    curl \
    git \
    make \
    ssmtp \
    openssh-client \
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

COPY etc /etc

RUN \
  # Install composer
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  # Use https
  && composer config --global repo.packagist composer https://packagist.org \
  # Add composer parallel install plugin
  && composer global require hirak/prestissimo \
  # Cleanup cache
  && rm -rf /var/tmp/* /tmp/* /root/.composer/cache/* \
  # Display some debug output
  && php --version && php --ini && php -m

WORKDIR /app

CMD ["php-fpm5", "-F"]
