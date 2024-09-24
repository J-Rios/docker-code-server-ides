
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
	$(info - make build IDE=x86_64_c_cpp)
	$(info - make build IDE=arm_c_cpp)
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
# Following line is == ifndef IDE || WORKSPACE || PASSWORD
ifeq ($(and $(IDE),$(WORKSPACE),$(PASSWORD)),)
	$(info )
	$(info You need to provide IDE name, projects Workspace to mount and)
	$(info code-server Password to use.)
	$(info Examples:)
	$(info - make start IDE=x86_64_c_cpp WORKSPACE=~/my_projects \
			PASSWORD=mypassword1234)
	$(info - make start IDE=arm_c_cpp WORKSPACE=~/my_projects \
			PASSWORD=mypassword1234)
	$(info - make start IDE=python WORKSPACE=~/my_projects \
			PASSWORD=mypassword1234)
	$(info )
	$(error Invalid command)
endif
	@chmod +x src/container_start
	@src/container_start $(IDE) $(WORKSPACE) $(PASSWORD)

###############################################################################

# Target: make stop (stop Container)
.PHONY: stop
stop:
ifndef IDE
	$(info )
	$(info You need to provide name of IDE to stop.)
	$(info Examples:)
	$(info - make stop IDE=arm_c_cpp)
	$(info - make stop IDE=x86_64_c_cpp)
	$(info - make stop IDE=python)
	$(info )
	$(error Invalid command)
endif
	@chmod +x src/container_stop
	@src/container_stop $(IDE)

###############################################################################

# Target: make remove (remove all previously builds)
.PHONY: remove
remove:
ifndef IDE
	$(info )
	$(info You need to provide name of IDE to build.)
	$(info Examples:)
	$(info - make remove IDE=x86_64_c_cpp)
	$(info - make remove IDE=arm_c_cpp)
	$(info - make remove IDE=python)
	$(info )
	$(error Invalid command)
endif
	@chmod +x src/container_remove
	@src/container_remove $(IDE)

###############################################################################
