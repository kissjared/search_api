all: build push
.PHONY: build push test

PROJECT=search_engine

DOCKER_REGISTRY = harbor.weiboyi.com/${PROJECT}

APP=search_api

TAG = alpha

build:
	docker build -t $(DOCKER_REGISTRY)/${APP}:$(TAG) .

push:
	docker push $(DOCKER_REGISTRY)/${APP}:$(TAG)

clean:
	docker rm -f test

test:
	docker run --name test -d harbor.weiboyi.com/${PROJECT}/${APP}:$(TAG)
	docker ps -a|grep test
	docker logs test
