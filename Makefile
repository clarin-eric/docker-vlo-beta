include version

build:
	@sh cleanup.sh
	@sh prepare.sh
	@echo "Building docker image"
	@sed -i ".bak" "s/<NAME>/${NAME}/g" Dockerfile
	@docker build -t docker.clarin.eu/vlo-beta:${DOCKER_IMAGE_VERSION} . >> docker_build.log 2>&1
	@sed -i ".bak" "s/${NAME}/<NAME>/g" Dockerfile
	@sh cleanup.sh

push:
	@docker push docker.clarin.eu/vlo-beta:${DOCKER_IMAGE_VERSION}

all: build
