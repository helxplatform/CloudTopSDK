VERSION_FILE   := VERSION
VERSION        := $(shell cat ${VERSION_FILE})
DOCKER_REPO    := docker.io
DOCKER_OWNER   := cschreep
DOCKER_APP     := cloudtop-octave
DOCKER_VERSION := ${VERSION}
DOCKER_TAG     := ${DOCKER_OWNER}/${DOCKER_APP}:$(DOCKER_VERSION)
DOCKER_FILE    := Dockerfile

.DEFAULT_GOAL = help

.PHONY: help generate build publish clean all


$(info ${DOCKER_APP} ${VERSION})

help:
	@grep -E '^#[a-zA-Z\.\-]+:.*$$' $(MAKEFILE_LIST) | tr -d '#' | awk 'BEGIN {FS = ": "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

#build: Build Docker image(s)
build:
	docker build -f $(DOCKER_FILE) -t $(DOCKER_TAG) .

#publish: Push Docker image(s)
publish:
	docker tag ${DOCKER_TAG} ${DOCKER_REPO}/${DOCKER_TAG}
	docker push ${DOCKER_REPO}/${DOCKER_TAG}

#clean: Remove old stuff
clean:
	# TODO clean previous docker image build

all: clean build publish