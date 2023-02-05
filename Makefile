
# Target: make help (Show usage help information)
help:
	@cat README.md

# Target: make build (build Docker Image)
build:
	@chmod +x src/docker_build
	@src/docker_build $(NAME) $(IDE)

# Target: make remove (remove all previously builds)
remove:
	@chmod +x src/docker_remove
	@src/docker_remove $(NAME)

# Target: make rebuild (remove previously builds and build again)
rebuild: remove build

# Target: make run (run a Docker Image)
start:
	@chmod +x src/docker_start
	@src/docker_start $(NAME) $(WORKSPACE) $(PASSWORD)

# Target: make stop (stop a Docker Image)
stop:
	@chmod +x src/docker_stop
	@src/docker_stop $(NAME)
