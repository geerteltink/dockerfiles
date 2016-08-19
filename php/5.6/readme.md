# PHP

- latest ([7.0/Dockerfile](https://github.com/xtreamwayz/docker-stack/blob/master/php/7.0/Dockerfile))
- 5.6 ([5.6/Dockerfile](https://github.com/xtreamwayz/docker-stack/blob/master/php/5.6/Dockerfile))

*Build with the [packages](http://pkgs.alpinelinux.org/packages?name=php5*) from Alpine Linux.*
*Build with the [packages](http://pkgs.alpinelinux.org/packages?name=php7*) from Alpine Linux.*

## Includes

- PHP-FPM + CLI
- bcmath, curl, ctype, dom, gd, iconv, intl, json, mbstring, mcrypt, mysqli, opcache, openssl, pcntl, pdo, pdo_mysql, pdo_sqlite, phar, session, sockets, xml, redis, xdebug
- [composer](https://getcomposer.org/doc/)
- [ssmtp](http://linux.die.net/man/8/ssmtp) to catch php mail() and forwards it to MailHog
- PHP 5.6 also includes mysql

## Commands

$ docker exec -ti <container_name> /bin/sh
$ docker exec -ti <container_name> composer <arguments>
