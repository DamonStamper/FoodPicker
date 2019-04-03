socket := $(subst tcp://,,${DOCKER_HOST})
ip := $(subst :2376,,$(socket))

ip:
	echo "${DOCKER_HOST}"
	echo "${socket}"
	echo "${ip}"

test: up
	curl ${ip}:80

build:
	docker-compose build

up: build
	docker-compose up -d
