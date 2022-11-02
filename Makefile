build_docker:
	docker build --platform linux/amd64 -t slambook2 .

run_docker:
	docker run \
                -it \
                -v $(shell pwd):/workspace \
                slambook2