run:
	docker run -d -p 8003:8003 --rm --name alla allasydoriak/my-test-app:latest
stop:
	docker stop alla
build:
	docker build -t allasydoriak/my-test-app .
remove:
	docker rmi allasydoriak/my-test-app