# Makefile as a Deployment Tool
#
# Docs and examples:
#	http://www.gnu.org/software/make/manual/make.html
#	https://cbednarski.com/articles/makefiles-for-everyone/
#	https://github.com/njh/easyrdf/blob/master/Makefile
#	http://mywiki.wooledge.org/BashGuide/TestsAndConditionals

include .env

# Init
DOCKER := $(shell which docker)
DOCKER_PHP := docker exec $(PROJECT_ID)-php
DOCKER_REDIS := docker exec $(PROJECT_ID)-redis
DOCKER_NODE := docker run --rm --volumes-from $(PROJECT_ID)-datastore -w="//app" node:slim
DOCKER_MYSQL := docker exec $(PROJECT_ID)-db mysql -h"db" -P"3306" -uroot -p"$(MYSQL_ROOT_PASSWORD)"

MYSQL_DEV_QUERY  = CREATE DATABASE IF NOT EXISTS $(MYSQL_DEV_DATABASE);
MYSQL_DEV_QUERY += CREATE USER IF NOT EXISTS '$(MYSQL_DEV_USER)'@'%' IDENTIFIED BY '$(MYSQL_DEV_PASSWORD)';
MYSQL_DEV_QUERY += GRANT ALL PRIVILEGES ON $(MYSQL_DEV_DATABASE).* TO '$(MYSQL_DEV_USER)'@'%';

MYSQL_TEST_QUERY  = CREATE DATABASE IF NOT EXISTS $(MYSQL_TEST_DATABASE);
MYSQL_TEST_QUERY += CREATE USER IF NOT EXISTS '$(MYSQL_TEST_USER)'@'%' IDENTIFIED BY '$(MYSQL_TEST_PASSWORD)';
MYSQL_TEST_QUERY += GRANT ALL PRIVILEGES ON $(MYSQL_TEST_DATABASE).* TO '$(MYSQL_TEST_USER)'@'%';

ifndef DOCKER
	$(error Docker not found)
endif

.DEFAULT: help
all: help

# TARGET:install            Install utilities (NodeJS + NPM required)
.PHONY: install
install:
	$(info ... Installing dependencies)
	@if [ -n "$(MYSQL_DEV_DATABASE)" ] && [ -n "$(MYSQL_DEV_USER)" ] && [ -n "$(MYSQL_DEV_PASSWORD)" ]; then \
		echo "... Creating develop database"; \
		$(DOCKER_MYSQL) -e "$(MYSQL_DEV_QUERY)"; \
	fi;
	@if [ -n "$(MYSQL_TEST_DATABASE)" ] && [ -n "$(MYSQL_TEST_USER)" ] && [ -n "$(MYSQL_TEST_PASSWORD)" ]; then \
		echo "... Creating test database"; \
		$(DOCKER_MYSQL) -e "$(MYSQL_TEST_QUERY)"; \
	fi;
	@if [ -f package.json ]; then \
		$(DOCKER_NODE) npm install --no-bin-links; \
	fi;
	@if [ -f composer.json ]; then \
		$(DOCKER_PHP) composer install; \
	fi;

# TARGET:update             Update assets & dependencies
.PHONY: update
update:
	$(info ... Updating assets & dependencies)
	docker-compose pull
	@if [ -f package.json ]; then \
		$(DOCKER_NODE) npm update --no-bin-links; \
	fi;
	@if [ -f composer.json ]; then \
		$(DOCKER_PHP) composer update; \
	fi;

# TARGET:clean              Clean up before building
.PHONY: clean
clean:
	$(info ... Cleaning up)
	rm -rf data/build
	rm -rf public/assets/*

# TARGET:build              Build assets
.PHONY: build
build: clean
	$(info ... Building assets)
	mkdir -p data/build
	mkdir -p public/assets/css
	mkdir -p public/assets/fonts
	mkdir -p public/assets/img
	mkdir -p public/assets/js
	$(DOCKER_NODE) node_modules/uglify-js/bin/uglifyjs \
		node_modules/jquery/dist/jquery.js \
		--compress --mangle --screw-ie8 --output public/assets/js/jquery.min.js
	$(DOCKER_NODE) node_modules/uglify-js/bin/uglifyjs \
		node_modules/bootstrap/dist/js/umd/util.js \
		node_modules/bootstrap/dist/js/umd/alert.js \
		node_modules/bootstrap/dist/js/umd/button.js \
		node_modules/bootstrap/dist/js/umd/carousel.js \
		node_modules/bootstrap/dist/js/umd/collapse.js \
		node_modules/bootstrap/dist/js/umd/dropdown.js \
		node_modules/bootstrap/dist/js/umd/modal.js \
		--compress --mangle --screw-ie8 --output public/assets/js/core.min.js
	$(DOCKER_NODE) node_modules/node-sass/bin/node-sass \
		resources/public/scss/core.scss data/build/core.css
	$(DOCKER_NODE) node_modules/postcss-cli/bin/postcss \
		--use autoprefixer --autoprefixer.browsers "last 2 versions" \
		--output data/build/core.prefixed.css data/build/core.css
	$(DOCKER_NODE) node_modules/uglifycss/uglifycss \
		data/build/core.prefixed.css > public/assets/css/core.min.css
	cp node_modules/font-awesome/fonts/*.* public/assets/fonts/
	cp resources/public/img/* public/assets/img/

# TARGET:test               Run unit tests and detect coding standard violations
.PHONY: test
test:
	$(info ... Running tests)
	$(DOCKER_PHP) vendor/bin/phpcs
	$(DOCKER_PHP) vendor/bin/phpunit

# TARGET:fix                Fix coding standard violations
.PHONY: fix
fix:
	$(info ... Fixing code)
	$(DOCKER_PHP) vendor/bin/phpcbf

# TARGET:coverage           Generate code coverage report
.PHONY: coverage
coverage:
	$(info ... Generating code coverage report)
	$(DOCKER_PHP) rm -rf data/coverage
	$(DOCKER_PHP) vendor/bin/phpunit --coverage-html ./data/coverage

# TARGET:help               You're looking at it!
.PHONY: help
help:
	# Usage:
	#   make <target> [OPTION=value]
	#
	# Targets:
	@egrep "^# TARGET:" [Mm]akefile | sed 's/^# TARGET:/#   /'
	#
	# Options:
	#   PHP            Path to php
