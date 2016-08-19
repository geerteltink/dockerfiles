# PHP-FPM

Build with the [packages](http://pkgs.alpinelinux.org/packages?name=php*) from Alpine Linux.

## Tags

- latest ([7.0/Dockerfile](https://github.com/xtreamwayz/docker-stack/blob/master/php/7.0/Dockerfile))
- 5.6 ([5.6/Dockerfile](https://github.com/xtreamwayz/docker-stack/blob/master/php/5.6/Dockerfile))

## Includes

- PHP-FPM + CLI
- Extensions: bcmath, curl, ctype, dom, gd, iconv, intl, json, mbstring, mcrypt, mysql *(5.6 only)*, mysqli, opcache, openssl, pcntl, pdo, pdo_mysql, pdo_sqlite, phar, session, sockets, xdebug, xml, xmlreader, redis, zip, zlib
- [composer](https://getcomposer.org/doc/)
- [ssmtp](http://linux.die.net/man/8/ssmtp) to catch php mail() and forward to [MailHog](https://github.com/mailhog/MailHog)

## Commands

$ docker exec -ti <container_name> /bin/sh
$ docker exec -ti <container_name> composer <arguments>
