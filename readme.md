# dckr-stack

*nginx, php, mysql, redis, mailhog, livereload*

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## Usage

1. Use a custom [docker-compose.yml](docker-compose.yml) file to do the work for you. Adjust the settings needed for the project.
2. Copy `.env.dist` to `.env` and change at least the project id.
3. Start the container with `docker-compose up -d`.

- Data is available in the containers through the datastore in /app.
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

# Remove all unused data
$ docker system prune --force [--all]

# Remove one / all containers
$ docker rm <container_id>
$ docker rm -f $(docker ps -a -q)

# List all images
$ docker images

# Remove one / all images
$ docker rmi <container_id>
$ docker rmi -f $(docker images -q)
```
