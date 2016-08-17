# docker-stack

A collection of customized containers for a docker web development stack. Where possible they have a small footprint
with [Alpine Linux](http://alpinelinux.org/)

## Usage

Use a custom [docker-compose.yml](docker-compose.yml) file to do the work for you. Adjust the settings needed for
the project. Copy `.env.dist` to `.env` and change the project id.

Data is available through a datastore in /app.

The app is available at http://docker/.
[MailHog](https://github.com/mailhog/MailHog) is used to catch emails and can be accessed at http://docker:8025/.

### WordPress

A docker compose file for a WordPress stack is included. Copy docker-wordpress.yml to docker-compose.yml.

Create this dir structure:

	project_root
	├── data
	│   ├── mysql       -> Persitent MySQL data
	│   └── wordpress   -> WordPress source code (optional if you want code completion in your IDE)
	├── themes
	├── plugins
	└── uploads

The `data/mysql/` and `data/wordpress/` dirs are optional and only required if you want to save the data locally. Or,
in case for the WordPress source, if you need it for code completion in your (PhpStorm) IDE.

## Docker commands

```bash
# Start containers
$ docker-compose up
$ docker-compose -f docker-elk.yml up -d

# Start and force rebuilding the containers
$ docker-compose up --build

# Stop containers
$ docker-compose stop
$ docker-compose -f docker-elk.yml stop

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
