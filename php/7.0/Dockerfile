FROM alexmasterov/alpine-php:7.0

RUN \
  apk add --update \
    curl \
    git \
    ssmtp \
    openssh-client \

  # Cleanup
  && rm -rf /var/cache/apk/* /var/tmp/* /usr/share/doc /usr/share/man /tmp/*

COPY php-fpm.conf /etc/php/php-fpm.conf
COPY php.ini /etc/php/conf.d/php.ini
COPY ssmtp.conf /etc/ssmtp/ssmtp.conf

RUN \
  # Display some debug output
  php --version && php -m \

  # Install composer
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \

  # Use https and add composer parallel install plugin
  && composer config --global repo.packagist composer https://packagist.org \
  && composer global require hirak/prestissimo --no-ansi \

  # Cleanup
  && rm -rf /var/cache/apk/* /var/tmp/* /tmp/* /root/.composer/cache/*

WORKDIR /app
EXPOSE 9000

ENTRYPOINT ["tini", "--"]
CMD ["php-fpm"]
