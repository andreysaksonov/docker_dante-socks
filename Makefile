PROJECT := dante-socks

docker-build:
	docker build -t $(PROJECT) .

docker-run:
	docker run --rm -d -P $(PROJECT)
