PYTHON       = 	PYTHONPATH=. /usr/bin/env python3
VERSION_FILE = ./VERSION
VERSION      = $(shell cat ${VERSION_FILE})
DOCKER_REPO  = docker.io
DOCKER_OWNER = helxplatform

.DEFAULT_GOAL = help

.PHONY: help clean install test build image publish


$(info CloudtopSDK ${VERSION})

help:
	@grep -E '^#[a-zA-Z\.\-]+:.*$$' $(MAKEFILE_LIST) | tr -d '#' | awk 'BEGIN {FS = ": "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

#install: Install application along with required packages to local environment
install:
	${PYTHON} -m pip install --upgrade pip
	${PYTHON} -m pip install -r requirements.txt

#test.doc: Run doctests in the source code
test.doc:
	# Doc tests
	#${PYTHON} -m pytest --doctest-modules .

#test.unit: Run unit tests
test.unit:
	# Unit tests
	#${PYTHON} -m pytest tests/unit

#test.integration: Run unit tests
test.integration:
	# Integration tests
	#${PYTHON} -m pytest tests/integration

#test: Run all tests
test: test.doc test.unit test.integration

#build: Build the Docker image
build:
	# Build

#publish: Push the Docker image
publish:
	# Publish

#clean: Remove old data
clean:
	# Clean
