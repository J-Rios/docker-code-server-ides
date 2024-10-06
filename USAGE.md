
# OCI Container Code-Server IDEs

## Description

OCI Containers Images to create and use different kind of code-server
based Integrated Development Environments for specific software
development fields and programming languages (C/C++, Python, Rust...).

## Usage

Check available IDEs:
  make list

Build an Image for specific IDE:
  make build IDE=c_cpp
  make build IDE=c_cpp_arm
  make build IDE=python
  make build IDE=rust

Launch an IDE Container:
  make start IDE=c_cpp PASSWORD=pass1234 WORKSPACE=~/my_projects
  make start IDE=c_cpp_arm PASSWORD=pass1234 WORKSPACE=~/my_projects
  make start IDE=python PASSWORD=pass1234 WORKSPACE=~/my_projects
  make start IDE=rust PASSWORD=pass1234 WORKSPACE=~/my_projects

Stop a running Container of an IDE:
  make stop IDE=c_cpp
  make stop IDE=c_cpp_arm
  make stop IDE=python
  make stop IDE=rust

Connect as "root" into a running Container of an IDE:
  make connect IDE=c_cpp
  make connect IDE=c_cpp_arm
  make connect IDE=python
  make connect IDE=rust

Remove the Image of an IDE:
  make remove IDE=c_cpp
  make remove IDE=c_cpp_arm
  make remove IDE=python
  make remove IDE=rust
