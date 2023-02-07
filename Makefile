NAME ?= slack-chatgpt
CHART_NAME ?= $(NAME)
DOCKER_IMAGE ?= $(NAME)
DOCKER_TAG ?= latest

.PHONY: helm-lint
helm-lint:
	cd charts/$(CHART_NAME) && helm lint

.PHONY: docker-build
docker-build:
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) .

run:
	docker-compose up --build