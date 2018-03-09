.PHONY: build clean test shell stop up

help:
	@echo "Welcome to the Python Mozaggregator\n"
	@echo "The list of commands for local development:\n"
	@echo "  build      Builds the docker images for the docker-compose setup"
	@echo "  clean      Stops and removes all docker containers"
	@echo "  test       Cleans, builds, and runs tests"
	@echo "  shell      Opens a Bash shell"
	@echo "  up         Builds and runs the whole stack"
	@echo "  stop       Stops the docker containers"

build:
	docker-compose build

clean: stop
	docker-compose rm -f

shell: build
	docker-compose run web bash

test:
	docker-compose up --build --abort-on-container-exit test

stop:
	docker-compose down
	docker-compose stop

up: clean
	docker-compose pull
	docker-compose up --build -d web