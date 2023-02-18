#
# Docker File for x86 and AMD64 devices C/C++ Development Environment.
#
# It Install all the needed tools on top of a base Linux image to allow
# software development for x86 and AMD64 processors using C/C++.
#
# Main components that are installed and needed for the development are:
# - C and C++ Toolchains (All required tools for development)
# - CMake & Make (Build the project)
# - Code-Server + Extensions (Write code and use other tools as backend)
#

###############################################################################

# Base OS
FROM debian:bullseye

# System User Name
ARG USER="user"

# User .bashrc file
ARG BASHRC="/home/${USER}/.bashrc"

###############################################################################

# CMake Configuration
ARG CMAKE_VERSION="3.25.2"
ARG CMAKE_PKG="cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz"
ARG CMAKE_REPO_URL="https://github.com/Kitware/CMake/releases/download"
ARG CMAKE_PKG_URL="${CMAKE_REPO_URL}/v${CMAKE_VERSION}/${CMAKE_PKG}"

# Code Server Configuration
ARG CODESRV_DATA_DIR="/home/$USER/.local/share/code-server/"
ARG CODESRV_EXT_DIR="/home/$USER/.local/share/code-server/extensions/"

###############################################################################

# Set Environment Variable for no user interaction with APT
ARG DEBIAN_FRONTEND=noninteractive

# Curl Command Setup
ARG CURL="curl --progress-bar --show-error"

# Code-Server Extension Install
ARG CODESRV_INSTALL_EXT="code-server --force \
    --extensions-dir $CODESRV_EXT_DIR --install-extension"

###############################################################################

# Create User and add it to sudo group
RUN useradd -m -G sudo -s /bin/bash $USER

# Install the dependencies
RUN apt-get update && apt-get install --yes apt-utils
RUN apt-get install --yes \
    sudo nano procps udev dbus-x11 curl git doxygen graphviz make gdb \
    build-essential clang clangd cppcheck valgrind strace libsecret-1-0 \
    libncurses5 libncurses5-dev libncursesw5-dev libc6 libc6-dev libstdc++6 \
    libudev-dev python3 python3-pip

# Install CMake
RUN $CURL -o cmake.tar.gz -L "${CMAKE_PKG_URL}" && \
    tar -xvzf /cmake.tar.gz -C /tmp && \
    cp -R /tmp/cmake*/* /usr/ && \
    rm -rf /tmp/cmake* && \
    rm /cmake.tar.gz

# Install Code-Server
RUN curl -fsSL https://code-server.dev/install.sh | sh && \
    mkdir -p $CODESRV_EXT_DIR && \
    mkdir -p /home/$USER/.local/share/code-server/User && \
    mkdir -p /home/$USER/.config && \
    mkdir -p /home/$USER/projects

# Install the vscode extensions
#RUN $CODESRV_INSTALL_EXT ms-vscode.cpptools-extension-pack@1.2.0
RUN $CODESRV_INSTALL_EXT llvm-vs-code-extensions.vscode-clangd@0.1.23
RUN $CODESRV_INSTALL_EXT twxs.cmake@0.0.17
RUN $CODESRV_INSTALL_EXT jbenden.c-cpp-flylint@1.13.0
RUN $CODESRV_INSTALL_EXT shardulm94.trailing-spaces@0.4.1
RUN $CODESRV_INSTALL_EXT webfreak.debug@0.26.0
RUN $CODESRV_INSTALL_EXT DavidAnson.vscode-markdownlint@0.48.1
RUN $CODESRV_INSTALL_EXT eamodio.gitlens@12.1.2
RUN $CODESRV_INSTALL_EXT mhutchie.git-graph@1.30.0
RUN $CODESRV_INSTALL_EXT donjayamanne.githistory@0.6.19
RUN $CODESRV_INSTALL_EXT cschlosser.doxdocgen@1.4.0
RUN $CODESRV_INSTALL_EXT streetsidesoftware.code-spell-checker@2.7.0

# Clean APT and temporary files
RUN apt-get clean && \
    rm -rf /config/* /tmp/* /var/lib/apt/lists/* /var/tmp/*

###############################################################################

# Change ownership permission of all files in User home directory
#RUN groupadd -r $USER && useradd -r -g $USER $USER
RUN chown $USER:$USER -R /home/$USER

# Set the container user that will use the image
ENV DOCKER_USER=$USER
USER $DOCKER_USER
ENV HOME=/home/$DOCKER_USER
WORKDIR /home/$DOCKER_USER

# Setup to launch code-server at container logging
CMD echo "code-server" >> /home/$DOCKER_USER/.bashrc && /bin/bash

###############################################################################
