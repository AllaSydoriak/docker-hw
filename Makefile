run:
	docker run -d -p 4200:80 --rm --name my-app allasydoriak/my-test-app
stop:
	docker stop my-app
build:
	docker build -t allasydoriak/my-test-app .
remove:
	docker rmi allasydoriak/my-test-app