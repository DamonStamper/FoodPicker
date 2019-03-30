ip=$(shell "$(DOCKER_HOST) | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'")
# curl ${ip}:80

test: up
	curl 192.168.99.101:80

build:
	docker-compose build

up: build
	docker-compose up -d
