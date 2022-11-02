docker_build:
	docker build --platform linux/amd64 -t slambook2 .

docker_run:
	docker run \
                -it \
                -v $(shell pwd):/workspace \
                slambook2