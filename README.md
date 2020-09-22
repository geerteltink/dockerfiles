# dockerfiles

![build-nginx](https://github.com/xtreamwayz/dockerfiles/workflows/build-nginx/badge.svg)
![build-mysql](https://github.com/xtreamwayz/dockerfiles/workflows/build-mysql/badge.svg)
![build-php-7-4](https://github.com/xtreamwayz/dockerfiles/workflows/build-php-7-4/badge.svg)
![build-php-8-0](https://github.com/xtreamwayz/dockerfiles/workflows/build-php-8-0/badge.svg)

_This is part of the [xtreamwayz/dockerfiles](https://github.com/xtreamwayz/dockerfiles)._

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## containers

- **xtreamwayz/nginx:** [latest](https://github.com/xtreamwayz/dockerfiles/blob/master/nginx/latest.dockerfile)
- **xtreamwayz/php:** [7.4-cli](https://github.com/xtreamwayz/dockerfiles/blob/master/php/7.4-cli.dockerfile), [7.4-fpm](https://github.com/xtreamwayz/dockerfiles/blob/master/php/7.4-fpm.dockerfile),[8.0-cli](https://github.com/xtreamwayz/dockerfiles/blob/master/php/8.0-cli.dockerfile), [8.0-fpm](https://github.com/xtreamwayz/dockerfiles/blob/master/php/8.0-fpm.dockerfile)
- **xtreamwayz/mysql:** [latest](https://github.com/xtreamwayz/dockerfiles/blob/master/mysql/latest.dockerfile)
- **xtreamwayz/hugo:** [latest](https://github.com/xtreamwayz/dockerfiles/blob/master/hugo/latest.dockerfile)

## Usage

1. Use a custom [docker-compose.yml](docker-compose.yml) file to do the work for you. Adjust the settings needed for the project.
2. Copy `.env.dist` to `.env` and change at least the project id.
3. Start the container with `docker-compose up -d`.

- For consistency the source code lives in the `/app` dir.
- The app is available at [http://localhost/](http://localhost/).
- [MailHog](https://github.com/mailhog/MailHog) is used to catch emails and can be accessed at [http://localhost:8025/](http://localhost:8025/).

## Fixing "Permission Denied" Issues

Use setfacl to set permission on the host

```bash
sudo setfacl -Rm g:82:rwX,d:g:82:rwX /home/<username>/projects
```

Setup permissions for docker so the files can be accessed and deleted.
The trick is to use the uid's from the docker processes.
_www-data/nginx: 82 - docker: 999 - mysql: 28_

```bash
# Preserve default permissions for new files and folders
sudo setfacl -dR -m u:28:rwx -m u:82:rwx -m u:33:rwx -m u:999:rwx -m u:$(whoami):rwx data
# Set permissions
sudo setfacl -R -m u:28:rwx -m u:82:rwx -m u:33:rwx -m u:999:rwx -m u:$(whoami):rwx data
```

## Xdebug

Xdebug is configured so it doesn't start automatically. You need to enable the debug listener in PhpStorm first and enable a session cookie in your [Chrome](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc) or [Firefox](https://chrome.google.com/extensions/detail/eadndfjplgieldjbigjakmdgkmoaaaoc) browser.

## Building manually

```bash
docker build . --file Dockerfile --tag dev
docker run --rm -it tag
```

## Docker commands

Start containers

```bash
$ docker-compose up -d
```

Start and force rebuilding the containers

```bash
$ docker-compose up --build
```

Stop containers

```bash
$ docker-compose stop
```

Update containers

```bash
$ docker-compose pull
```

Stream logs from all containers to the console

```bash
$ docker-compose logs -t -f
```

Start a terminal for <container_name>

```bash
# With docker-compose
$ docker-compose run --rm php /bin/bash   # Ubuntu/Debian based
$ docker-compose run --rm php /bin/sh     # Alpine Linux based
# With docker
$ docker exec -ti <container_name> /bin/bash   # Ubuntu/Debian based
$ docker exec -ti <container_name> /bin/sh     # Alpine Linux based
```

## Docker maintenance commands

Stats for running containers

```bash
$ docker stats -a
```

Show used space, similar to the unix tool df

```bash
$ docker system df
```

Remove development junk: unused volumes, networks, exited containers and unused images

```bash
$ docker system prune --force --all
```

List all images

```bash
$ docker images
```

List containers

```bash
$ docker ps
```

Force stop all containers in PowerShell

```powershell
> docker ps -a -q | ForEach { docker stop $_ }
```
