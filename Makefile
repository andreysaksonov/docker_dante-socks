IMAGE_TAG := andreysaksonov/dante-socks:latest
PROXY_USER_PASSWORD ?= proxy

.PHONY: build
build:
	docker build -t $(IMAGE_TAG) .

.PHONY: run
run: build
	docker run -it -p 1080:1080/tcp -p 1080:1080/udp -e PROXY_USER_PASSWORD=$(PROXY_USER_PASSWORD) $(IMAGE_TAG)

.PHONY: install
install: build
	docker run -d -p 1080:1080/tcp -p 1080:1080/udp -e PROXY_USER_PASSWORD=$(PROXY_USER_PASSWORD) $(IMAGE_TAG)
