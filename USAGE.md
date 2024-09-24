
# OCI Container Code-Server IDEs

## Description

OCI Containers Images to create and use different kind of code-server
based Integrated Development Environments for specific software
development fields and programming languages (C/C++, Python, Rust...).

## Usage

Check available IDEs:
  make list

Build an Image for specific IDE:
  make build IDE=x86_64_c_cpp
  make build IDE=arm_c_cpp
  make build IDE=python

Launch an IDE Container:
  make start IDE=x86_64_c_cpp WORKSPACE=~/my_projects PASSWORD=pass1234
  make start IDE=arm_c_cpp WORKSPACE=~/my_projects PASSWORD=pass1234
  make start IDE=python WORKSPACE=~/my_projects PASSWORD=pass1234

Stop a running Container of an IDE:
  make stop IDE=arm_c_cpp
  make stop IDE=x86_64_c_cpp
  make stop IDE=python

Remove the Image of an IDE:
  make remove IDE=x86_64_c_cpp
  make remove IDE=arm_c_cpp
  make remove IDE=python

