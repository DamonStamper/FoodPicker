.DEFAULT_GOAL := help

# If the environment variable DOCKER_HOST is set then pull info from it
ifeq ($(DOCKER_HOST),"TRUE") 
	socket := $(subst tcp://,,${DOCKER_HOST})
	ip := $(subst :2376,,$(socket))
# Otherwise assume localhost is valid.
else
	DOCKER_HOST := "localhost"
	socket := "localhost:2376"
	ip := "localhost"
endif

help: ## print help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

ip: ## Display IP address of Docker engine
	@echo "DOCKER_HOST: ${DOCKER_HOST}"
	@echo "Docker socket: ${socket}"
	@echo "Docker ip: ${ip}"

test: up ## Test the containers
	curl ${ip}:80

build: ## Build the containers
	docker-compose build

cleanbuild: ## Build the containers without reusing any previously built layers.
	docker-compose build --no-cache

up: build ## Start the containers
	docker-compose up -d

stop: ## Stop the containers
	docker-compose stop

down: stop ## Stop the containers

rm: stop  ## Remove the containers
	docker-compose rm -f

destroy: stop rm ## Remove the containers