# PHP-FPM Docker Container

*This is part of the [xtreamwayz/dckr-stack](https://github.com/xtreamwayz/dckr-stack).*

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## dckr-stack containers

- **xtreamwayz/nginx:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/nginx/Dockerfile)
- **xtreamwayz/php:** [5.6](https://github.com/xtreamwayz/dckr-stack/blob/master/php/5.6/Dockerfile) ([Alpine Linux](https://pkgs.alpinelinux.org/packages?name=php5*&branch=edge&arch=x86_64)), [7.0](https://github.com/xtreamwayz/dckr-stack/blob/master/php/7.0/Dockerfile) ([Alpine Linux](https://pkgs.alpinelinux.org/packages?name=php7*&branch=edge&arch=x86_64)), [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/php/7.1/Dockerfile) ([7.1.x-dev Source](https://github.com/php/php-src))
- **xtreamwayz/mysql:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/mysql/Dockerfile)
- **xtreamwayz/livereload:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/livereload/Dockerfile)

## Includes

- PHP-FPM + CLI
- Extensions: bcmath, curl, ctype, dom, gd, iconv, intl, json, mbstring, mcrypt, mysql *(5.6 only)*, mysqli, opcache, openssl, pcntl, pdo, pdo_mysql, pdo_sqlite, phar, session, sockets, xdebug, xml, xmlreader, redis, zip, zlib
- [composer](https://getcomposer.org/doc/)
- [ssmtp](http://linux.die.net/man/8/ssmtp) to catch php mail() and forward to [MailHog](https://github.com/mailhog/MailHog)

## Usage

Add this to your `docker-compose.yml` file:

```yaml
php:
  image: xtreamwayz/php:latest      # Use for PHP 7.0.x
  #image: xtreamwayz/php:5.6        # Use for PHP 5.6.x
  container_name: ${PROJECT_ID}-php
  volumes_from:
    - datastore
  links:
    - db        # Optional
    - redis     # Optional
    - mailhog   # Optional
```

## CLI commands

```bash
# Access container
docker exec -ti <PROJECT_ID>-php /bin/sh

# Run composer
docker exec -ti <PROJECT_ID>-php composer <arguments>
```
