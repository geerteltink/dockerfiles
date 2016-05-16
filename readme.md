# docker-stack

Skeleton for a docker php stack. Everything is in its own container, just like how it's meant to be.

## Available containers:
- web:
    NGINX -> http://docker/
- php:
    PHP -> docker exec -ti php php <command>
    composer -> docker exec -ti php composer <command>
    ssmtp, catches php mail() and forwards it to MailHog
- db: MySQL
- redis: Redis
- mailhog: MailHog -> http://docker:8025/

## Docker commands

```bash
# Start docker
$ docker-compose up

# Start docker and force rebuilding the containers
$ docker-compose up --build

# Start a terminal for <container_name>
$ docker exec -ti <container_name> /bin/bash
$ docker exec -ti <container_name> /bin/sh

# Run composer
$ docker exec -ti php composer <command>

# List containers
$ docker ps

# Remove all containers
$ docker rm -f `docker ps -a -q`

# List all docker images
$ docker images

# Remove all images
$ docker rmi -f $(docker images -q)

```
