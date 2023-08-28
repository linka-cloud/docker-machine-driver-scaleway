DOCKER_MACHINE_IMAGE := linkacloud/docker-machine-scaleway
RUNNER_IMAGE := linkacloud/gitlab-runner-docker-machine-scaleway

docker: docker-build docker-push

docker-build:
	@docker build -t $(DOCKER_MACHINE_IMAGE) .
	@docker build -t $(RUNNER_IMAGE) -f gitlab-runner.Dockerfile .
docker-push:
	@docker push $(DOCKER_MACHINE_IMAGE)
	@docker push $(RUNNER_IMAGE)
