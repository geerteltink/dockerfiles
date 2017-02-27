# dckr-stack

*This is part of the [xtreamwayz/dckr-stack](https://github.com/xtreamwayz/dckr-stack).*

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## dckr-stack containers

- **xtreamwayz/nginx:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/nginx/Dockerfile)
- **xtreamwayz/php:** [5.6](https://github.com/xtreamwayz/dckr-stack/blob/master/php/5.6/Dockerfile) ([Alpine Linux](https://pkgs.alpinelinux.org/packages?name=php5*&branch=edge&arch=x86_64)), [7.0](https://github.com/xtreamwayz/dckr-stack/blob/master/php/7.0/Dockerfile) ([Alpine Linux](https://pkgs.alpinelinux.org/packages?name=php7*&branch=edge&arch=x86_64)), [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/php/7.1/Dockerfile) ([7.1.x-dev Source](https://github.com/php/php-src))
- **xtreamwayz/mysql:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/mysql/Dockerfile)
- **xtreamwayz/livereload:** [latest](https://github.com/xtreamwayz/dckr-stack/blob/master/livereload/Dockerfile)

## Usage

1. Use a custom [docker-compose.yml](docker-compose.yml) file to do the work for you. Adjust the settings needed for the project.
2. Copy `.env.dist` to `.env` and change at least the project id.
3. Start the container with `docker-compose up -d`.

- For consistency the source code lives in the `/app` dir.
- The app is available at [http://localhost/](http://localhost/).
- [MailHog](https://github.com/mailhog/MailHog) is used to catch emails and can be accessed at [http://localhost:8025/](http://localhost:8025/).

## Docker commands

```bash
# Start containers
$ docker-compose up

# Start and force rebuilding the containers
$ docker-compose up --build

# Stop containers
$ docker-compose stop

# Update containers
$ docker-compose pull

# Stream logs from all containers to the console
$ docker-compose logs -t -f

# Start a terminal for <container_name>
$ docker exec -ti <container_name> /bin/bash   # Ubuntu/Debian based
$ docker exec -ti <container_name> /bin/sh     # Alpine Linux based

# List containers
$ docker ps
```

## Docker maintenance commands

```bash
# Show used space, similar to the unix tool df
$ docker system df

# Remove development junk: unused volumes, networks, exited containers and unused images
$ docker system prune --force --all

# List all images
$ docker images

# Remove dangling images
$ docker rmi $(docker images -q -f dangling=true)

# Remove exited containers
$ docker rm $(docker ps -q -f status=exited)

# Remove dangling volumes
$ docker volume rm $(docker volume ls -q -f dangling=true)
```
