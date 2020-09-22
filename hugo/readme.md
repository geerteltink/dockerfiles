# Hugo Docker Container

![build-hugo](https://github.com/xtreamwayz/dockerfiles/workflows/build-hugo/badge.svg)

_This is part of the [xtreamwayz/dockerfiles](https://github.com/xtreamwayz/dockerfiles)._

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## containers

- **xtreamwayz/nginx:** [latest](https://github.com/xtreamwayz/dockerfiles/blob/master/nginx/latest.dockerfile)
- **xtreamwayz/php:** [7.4-cli](https://github.com/xtreamwayz/dockerfiles/blob/master/php/7.4-cli.dockerfile), [7.4-fpm](https://github.com/xtreamwayz/dockerfiles/blob/master/php/7.4-fpm.dockerfile),[8.0-cli](https://github.com/xtreamwayz/dockerfiles/blob/master/php/8.0-cli.dockerfile), [8.0-fpm](https://github.com/xtreamwayz/dockerfiles/blob/master/php/8.0-fpm.dockerfile)
- **xtreamwayz/mysql:** [latest](https://github.com/xtreamwayz/dockerfiles/blob/master/mysql/latest.dockerfile)
- **xtreamwayz/hugo:** [latest](https://github.com/xtreamwayz/dockerfiles/blob/master/hugo/latest.dockerfile)

## Usage

```bash
docker build . --file latest.dockerfile --tag "xtreamwayz/hugo:latest" --cache-from "xtreamwayz/hugo:latest"
docker run --rm -it xtreamwayz/hugo:latest npm install
docker run --rm -it xtreamwayz/hugo:latest hugo <command>
```

## CLI commands

```bash
docker run --rm -it xtreamwayz/hugo hugo help
docker run --rm -it xtreamwayz/hugo hugo version
docker run --rm -it --volume $(pwd):/src xtreamwayz/hugo npm install
docker run --rm -it --volume $(pwd):/src xtreamwayz/hugo hugo mod init website
docker run --rm -it --volume $(pwd):/src xtreamwayz/hugo hugo --gc --minify --enableGitInfo --environment production
```
