FROM alexmasterov/alpine-php:7.0

RUN \
  apk add --update \
    curl \
    git \
    ssmtp \
    openssh-client

COPY php-fpm.conf /etc/php/php-fpm.conf
COPY php.ini /etc/php/conf.d/php.ini
COPY xdebug.ini /etc/php/conf.d/xdebug.ini
COPY ssmtp.conf /etc/ssmtp/ssmtp.conf

RUN \
  # Install composer
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  # Use https
  && composer config --global repo.packagist composer https://packagist.org \
  # Add composer parallel install plugin
  && composer global require hirak/prestissimo --no-ansi \
  # Removing build dependencies, clean temporary files
  && apk del .php-build-dependencies \
  && rm -rf /var/cache/apk/* /var/tmp/* /tmp/* /root/.composer/cache/* \
  # Display some debug output
  && php --version && php --ini && php -m

WORKDIR /app

ENTRYPOINT ["tini", "--"]
CMD ["php-fpm"]
