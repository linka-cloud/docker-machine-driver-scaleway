DOCKER_MACHINE_IMAGE := linkacloud/docker-machine-scaleway
RUNNER_IMAGE := linkacloud/gitlab-runner-docker-machine-scaleway

# renovate: datasource=gitlab-tags depName=gitlab-org/gitlab-runner versioning=semver
RUNNER_VERSION := v16.9.1

docker: docker-build docker-push

docker-build:
	@docker build --target docker-machine -t $(DOCKER_MACHINE_IMAGE) .
	@docker build --target gitlab-runner -t $(RUNNER_IMAGE):$(RUNNER_VERSION) -t $(RUNNER_IMAGE):latest .
docker-push:
	@docker push $(DOCKER_MACHINE_IMAGE)
	@docker push $(RUNNER_IMAGE):$(RUNNER_VERSION)
	@docker push $(RUNNER_IMAGE):latest
