# MySQL Docker Container

![build-mysql](https://github.com/geerteltink/dockerfiles/workflows/build-mysql/badge.svg)

_This is part of the [geerteltink/dockerfiles](https://github.com/geerteltink/dockerfiles)._

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## Usage

Add this to your `docker-compose.yml` file:

```yaml
db:
  image: ghcr.io/geerteltink/mysql
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
