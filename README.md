# docker-code-server-ides

OCI Images to create different kind of [code-server](https://github.com/coder/code-server) based **Integrated Development Environments (IDEs)** Containers for specific software development fields and programming languages (C/C++, Python, Rust, etc.).

## Requirements

To use this repository, the next tools are needed:

- Unix based OS.
- Make.
- Docker/Podman.

## Notes

- The repository uses **Make** as main tool for build and use any of the created IDEs. *Make* abstracts, unifies and standardizes the usage of this tool.

- Some **Bash** scripts are provided to ease usage of OCI tool (docker/podman) for build, use and remove Images and Containers. *Make* uses this scripts and doesn't need to be used directly by the user.

- Due Microsoft Terms of Service prohibits the use of any non-Microsoft VS Code from accessing their marketplace, code-server can't use Microsoft Marketplace to install extensions. Instead, code-server use the [Open-VSX extension gallery](https://open-vsx.org/).
