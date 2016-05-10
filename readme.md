# docker-stack

Skeleton for a docker nginx / php / mysql / redis stack. Everything is in its own container, just like how it's meant to be.

## Docker commands

```bash
# Start docker
$ docker-compose up

# Start docker and force rebuilding the containers
$ docker-compose up --build

# Start a terminal for <container_name>
$ docker exec -ti <container_name> /bin/bash

# List containers
$ docker ps

# Remove all containers
$ docker rm -f `docker ps -a -q`

# List all docker images
$ docker images

# Remove all images
$ docker rmi -f $(docker images -q)

```