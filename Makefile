PYTHON       := /usr/bin/env python3
PROJECT      := CloudTopSDK
VERSION_FILE = ./src/cloudtop_sdk/_version.py
VERSION      := $(shell cut -d " " -f 3 ${VERSION_FILE})
DOCKER_REPO  := docker.io
DOCKER_OWNER := helxplatform

.DEFAULT_GOAL = help

.PHONY: help clean install test build image publish


$(info ${PROJECT} ${VERSION})

help:
	@grep -E '^#[a-zA-Z\.\-]+:.*$$' $(MAKEFILE_LIST) | tr -d '#' | awk 'BEGIN {FS = ": "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

#install: Install required packages to local environment
install:
	${PYTHON} -m pip install --upgrade pip
	${PYTHON} -m pip install -r requirements.txt
	${PYTHON} -m pip install .

#test.doc: Run doctests in the source code
test.doc:
	# Doc tests
	#${PYTHON} -m pytest --doctest-modules .

#test.unit: Run unit tests
test.unit:
	# Unit tests
	${PYTHON} -m pytest tests/unit

#test.integration: Run unit tests
test.integration:
	# Integration tests
	${PYTHON} -m pytest tests/integration

#test: Run all tests
test: test.doc test.unit test.integration

#build: Build Docker image(s)
build:
	# TODO build python app

#publish: Push Docker image(s)
publish:
	# TODO publish python app

#clean: Remove old stuff
clean:
	${PYTHON} -m pip uninstall -y cloudtop-sdk
	${PYTHON} -m pip uninstall -y -r requirements.txt
	# TODO rm build dirs
