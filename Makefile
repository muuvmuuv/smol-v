.PHONY: help

# Print help
help:
	@cat $(MAKEFILE_LIST) | docker run --pull --rm -i xanders/make-help

# Format all files
format:
	v fmt -w .

# Get docker container size
size: start
	docker ps --size | grep "smol:v" | sed -e "s/.*virtual \(.*\)).*/\1/"

##
## Docker
##

# Create the image
containerize:
	docker build --tag=smol:v .

# Run program attached
run:
	docker run --name smol-v --publish 6789:6789 --rm smol:v

# Start program detached
start:
	docker run --name smol-v --publish 6789:6789 --rm --detach smol:v

# Start program detached
stop:
	docker stop smol-v

# Show container logs
logs:
	docker logs -f smol-v