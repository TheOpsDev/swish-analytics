.PHONY: build help publish all

IMAGE_NAME=swish-analytics
REGISTRY=chrisherrera1
COMMIT_HASH=$(shell git rev-parse --short HEAD)
BUILD_DATE=$(shell date '+%Y-%m-%d-%H:%M:%S')
APP_NAME=chris-herrera

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

deploy:
	@echo "Initiating Helm deployment"
	helm upgrade --install --create-namespace -f swish-analytics-app/values.yaml ${APP_NAME} swish-analytics-app -n ${APP_NAME}

all: build publish