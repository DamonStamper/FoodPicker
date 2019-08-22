.DEFAULT_GOAL := help

socket := $(subst tcp://,,${DOCKER_HOST})
ip := $(subst :2376,,$(socket))

help: ## print help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

ip: ## Display IP address of Docker engine
	echo "DOCKER_HOST: ${DOCKER_HOST}"
	echo "Docker socket: ${socket}"
	echo "Docker ip: ${ip}"

test: up ## Test the containers
	curl ${ip}:80

build: ## Build the containers
	docker-compose build

up: build ## Bring up the containers
	docker-compose up -d
