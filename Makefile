.PHONY: build help publish all

IMAGE_NAME=swish-analytics
REGISTRY=chrisherrera1
COMMIT_HASH=$(shell git rev-parse --short HEAD)
BUILD_DATE=$(shell date '+%Y-%m-%d-%H:%M:%S')

help:
	@echo "Management commands for Swish Analytics"
	@echo
	@echo "Usage:"
	@echo "		make build			Build Docker Image."
	@echo "		make publish		Publish Docker image to registry."
	@echo "		make all			Execute both build and publish targets."
	@echo 

build:
	@echo "Initiating Docker Image build..."
	cd docker && docker build -f Dockerfile --no-cache -t ${REGISTRY}/${IMAGE_NAME}:latest -t ${REGISTRY}/${IMAGE_NAME}:${COMMIT_HASH} .
	@echo "Completed Docker Image build..."

publish:
	@echo "Pushing docker image to registry: latest ${COMMIT_HASH}"
	docker push ${REGISTRY}/${IMAGE_NAME}:${COMMIT_HASH}
	docker push ${REGISTRY}/${IMAGE_NAME}:latest

all: build publish