build: 
	@sh cleanup.sh
	@sh prepare.sh
	@echo "Building docker image"
	@docker build -t docker.clarin.eu/vlo-beta:1.0.1 . >> docker_build.log 2>&1
	@sh cleanup.sh

push:
	docker push docker.clarin.eu/vlo-beta:1.0.1

all: build
