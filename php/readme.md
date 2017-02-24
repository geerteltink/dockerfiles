# PHP-FPM Docker Container

*This is part of the [xtreamwayz/dckr-stack](https://github.com/xtreamwayz/dckr-stack).*

Build with the [packages](http://pkgs.alpinelinux.org/packages?name=php*) from Alpine Linux.

## Tags

- `5` ([5.6/Dockerfile](https://github.com/xtreamwayz/dckr-php/blob/master/5.6/Dockerfile)): build with packages from [Alpine Linux](https://pkgs.alpinelinux.org/packages?name=php5*&branch=edge&arch=x86_64)
- `7` ([7.x/Dockerfile](https://github.com/xtreamwayz/dckr-php/blob/master/7.x/Dockerfile)): build with packages from [Alpine Linux](https://pkgs.alpinelinux.org/packages?name=php7*&branch=edge&arch=x86_64)
- `latest` ([latest/Dockerfile](https://github.com/xtreamwayz/dckr-php/blob/master/latest/Dockerfile)): extends [php:7-fpm-alpine](https://hub.docker.com/_/php/)

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
