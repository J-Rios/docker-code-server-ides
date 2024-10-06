
###############################################################################

# Target: make help (Show usage help information)
.PHONY: help
help:
	@cat USAGE.md

###############################################################################

# Target: make list (List available IDEs)
.PHONY: list
list:
	@ls -1 ides

###############################################################################

# Target: make build (build Image)
.PHONY: build
build:
ifndef IDE
	$(info )
	$(info You need to provide name of IDE to build.)
	$(info Examples:)
	$(info - make build IDE=c_cpp)
	$(info - make build IDE=c_cpp_arm)
	$(info - make build IDE=python)
	$(info )
	$(error Invalid command)
endif
	@chmod +x src/container_build
	@src/container_build $(IDE) ides/$(IDE)

###############################################################################

# Target: make run (run Container)
.PHONY: start
start:
ifndef IDE
	$(info )
	$(info You need to provide IDE name, projects Workspace to mount and)
	$(info code-server Password to use.)
	$(info Examples:)
	$(info - make start IDE=c_cpp PASSWORD=mypassword1234)
	$(info - make start IDE=python PASSWORD=mypassword5678)
	$(info - make start IDE=c_cpp PASSWORD=mypassword1234 \
			WORKSPACE=~/my_projects)
	$(info )
	$(error Invalid command)
endif
	@chmod +x src/container_start
	@src/container_start $(IDE) $(PASSWORD) $(WORKSPACE)

###############################################################################

# Target: make stop (stop Container)
.PHONY: stop
stop:
ifndef IDE
	$(info )
	$(info You need to provide name of IDE to stop.)
	$(info Examples:)
	$(info - make stop IDE=c_cpp)
	$(info - make stop IDE=c_cpp_arm)
	$(info - make stop IDE=python)
	$(info )
	$(error Invalid command)
endif
	@chmod +x src/container_stop
	@src/container_stop $(IDE)

###############################################################################

# Target: make connect (connect Container)
.PHONY: connect
connect:
ifndef IDE
	$(info )
	$(info You need to provide name of IDE to connect to.)
	$(info Examples:)
	$(info - make connect IDE=c_cpp)
	$(info - make connect IDE=c_cpp_arm)
	$(info - make connect IDE=python)
	$(info )
	$(error Invalid command)
endif
	@chmod +x src/container_connect
	@src/container_connect $(IDE)

###############################################################################

# Target: make remove (remove all previously builds)
.PHONY: remove
remove:
ifndef IDE
	$(info )
	$(info You need to provide name of IDE to build.)
	$(info Examples:)
	$(info - make remove IDE=c_cpp)
	$(info - make remove IDE=c_cpp_arm)
	$(info - make remove IDE=python)
	$(info )
	$(error Invalid command)
endif
	@chmod +x src/container_remove
	@src/container_remove $(IDE)

###############################################################################
