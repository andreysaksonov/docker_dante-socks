PROJECT := dante-socks

docker-build:
	docker build -t $(PROJECT) .

docker-run:
	docker run -it -p 1080:1080/tcp -p 1080:1080/udp -e PROXY_USER_PASSWORD=test123 $(PROJECT)
