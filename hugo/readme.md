# Hugo Docker Container

![build-hugo](https://github.com/geerteltink/dockerfiles/workflows/build-hugo/badge.svg)

_This is part of the [geerteltink/dockerfiles](https://github.com/geerteltink/dockerfiles)._

A collection of customized containers for a Docker web development stack. Where possible the containers are build on top of [Alpine Linux](http://alpinelinux.org/) for a small footprint.

## Usage

```bash
docker build . --file latest.dockerfile --tag "ghcr.io/geerteltink/hugo:latest" --cache-from "ghcr.io/geerteltink/hugo:latest"
docker run --rm -it ghcr.io/geerteltink/hugo:latest npm install
docker run --rm -it ghcr.io/geerteltink/hugo:latest hugo <command>
```

## CLI commands

```bash
docker run --rm -it ghcr.io/geerteltink/hugo hugo help
docker run --rm -it ghcr.io/geerteltink/hugo hugo version
docker run --rm -it --volume $(pwd):/src ghcr.io/geerteltink/hugo npm install
docker run --rm -it --volume $(pwd):/src ghcr.io/geerteltink/hugo hugo mod init website
docker run --rm -it --volume $(pwd):/src ghcr.io/geerteltink/hugo hugo --gc --minify --enableGitInfo --environment production
```
