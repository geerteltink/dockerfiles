# MySQL Docker Container

*This is part of the [xtreamwayz/dckr-stack](https://github.com/xtreamwayz/dckr-stack).*

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## dckr-stack containers

- **xtreamwayz/nginx:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/nginx/Dockerfile)
- **xtreamwayz/php:** [5.6](https://github.com/xtreamwayz/dckr-stack/blob/master/php/5.6-fpm), [7.1-fpm](https://github.com/xtreamwayz/dckr-stack/blob/master/php/7.1-fpm), [7.2-fpm](https://github.com/xtreamwayz/dckr-stack/blob/master/php/7.2-fpm), [7.3-fpm](https://github.com/xtreamwayz/dckr-stack/blob/master/php/7.3-fpm)
- **xtreamwayz/mysql:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/mysql/Dockerfile)

## Usage

Add this to your `docker-compose.yml` file:

```yaml
  db:
    image: xtreamwayz/mysql
    container_name: PROJECT_ID-db
    ports:
      - "3306:3306"
    environment:
      - MYSQL_DATABASE=docker
      - MYSQL_PASSWORD=docker
      - MYSQL_ROOT_PASSWORD=docker
      - MYSQL_USER=docker
    #volumes:
    #  - ./data/mysql:/var/lib/mysql:rw,delegated
    #  - ./resources/docker-initdb:/docker-entrypoint-initdb.d:ro,cached
```

## CLI commands

```bash
# Access container
docker exec -ti <PROJECT_ID>-db /bin/sh
```

## Creating a new database and user

```bash
# Change UNIQUE_NAME-db with the name that is used in `docker-compose.yml` -> `services:db:container_name`
docker exec UNIQUE_NAME-db mysql -h"db" -P"3306" -uroot -p"docker" -e "CREATE DATABASE IF NOT EXISTS develop;"
docker exec UNIQUE_NAME-db mysql -h"db" -P"3306" -uroot -p"docker" -e "CREATE USER IF NOT EXISTS 'develop'@'%' IDENTIFIED BY 'develop';"
docker exec UNIQUE_NAME-db mysql -h"db" -P"3306" -uroot -p"docker" -e "GRANT ALL PRIVILEGES ON develop.* TO 'develop'@'%';"
```
