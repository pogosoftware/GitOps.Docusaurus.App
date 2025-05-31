# Variables
IMAGE_NAME = docusaurus
IMAGE_TAG = dev
CONTAINER_NAME = docusaurus-app
DEV_PORT = 3000

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

run:
	docker run -d --name $(CONTAINER_NAME) -p $(DEV_PORT):80 $(IMAGE_NAME):$(IMAGE_TAG)

logs:
	docker logs -f $(CONTAINER_NAME)

stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

clean: stop
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG) || true
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG) || true