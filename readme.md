# docker-stack

A collection of customized containers for a docker web development stack. Where possible they have a small footprint
with [Alpine Linux](http://alpinelinux.org/)

## Usage

Use a custom [docker-compose.yml](docker-compose.yml) file to do the work for you. Adjust with the settings needed for
the project.

Data is available through a datastore in /app.

The app is available at http://docker/.
[MailHog](https://github.com/mailhog/MailHog) is used to catch emails and can be accessed at http://docker:8025/.

## Docker commands

```bash
# Start docker
$ docker-compose up

# Start docker and force rebuilding the containers
$ docker-compose up --build

# Start a terminal for <container_name>
$ docker exec -ti <container_name> /bin/bash
$ docker exec -ti <container_name> /bin/sh

# List containers
$ docker ps

# Remove one / all containers
$ docker rm <container_id>
$ docker rm -f $(docker ps -a -q)

# List all docker images
$ docker images

# Remove one / all images
$ docker rmi <container_id>
$ docker rmi -f $(docker images -q)
```
