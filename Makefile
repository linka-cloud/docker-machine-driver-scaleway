DOCKER_MACHINE_IMAGE := linkacloud/docker-machine-scaleway
RUNNER_IMAGE := linkacloud/gitlab-runner-docker-machine-scaleway

# renovate: datasource=gitlab-tags depName=gitlab/gitlab-runner versioning=semver
RUNNER_VERSION := v16.8.0

docker: docker-build docker-push

docker-build:
	@docker build -t $(DOCKER_MACHINE_IMAGE) .
	@docker build -t $(RUNNER_IMAGE):$(RUNNER_VERSION) -f gitlab-runner.Dockerfile .
docker-push:
	@docker push $(DOCKER_MACHINE_IMAGE)
	@docker push $(RUNNER_IMAGE):$(RUNNER_VERSION)
