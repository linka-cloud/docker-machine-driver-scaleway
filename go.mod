module github.com/scaleway/docker-machine-driver-scaleway

replace (
	github.com/Sirupsen/logrus => github.com/sirupsen/logrus v1.9.3
	github.com/docker/docker => github.com/docker/engine v1.13.1
	github.com/renstrom/fuzzysearch v1.1.0 => github.com/lithammer/fuzzysearch v1.1.0
)

go 1.15

require (
	github.com/Azure/go-ansiterm v0.0.0-20230124172434-306776ec8161 // indirect
	github.com/docker/docker v27.0.1+incompatible // indirect
	github.com/docker/machine v0.16.2
	github.com/pkg/errors v0.8.1 // indirect
	github.com/scaleway/scaleway-sdk-go v1.0.0-beta.28
	github.com/sirupsen/logrus v1.9.3
	golang.org/x/crypto v0.24.0 // indirect
	gotest.tools v2.2.0+incompatible // indirect
)
