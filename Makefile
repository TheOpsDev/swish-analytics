.PHONY: build help publish

IMAGE_NAME=swish-analytics
COMMIT_HASH=$(shell git rev-parse --short HEAD)
BUILD_DATE=$(shell date '+%Y-%m-%d-%H:%M:%S')

help:
	@echo "Management commands for Swish Analytics"
	@echo
	@echo "Usage:"
	@echo "		make build		Build Docker Image"
	@echo 

build:
	@echo "Initiating Docker Image build..."
	docker build -f Dockerfile -t ${IMAGE_NAME}:latest -t ${IMAGE_NAME}:${COMMIT_HASH}
	@echo "Completed Docker Image build..."

publish:
	@echo "Pushing docker image to registry: latest ${COMMIT_HASH}"
	docker push ${IMAGE_NAME}:${COMMIT_HASH}
	docker push ${IMAGE_NAME}:latest