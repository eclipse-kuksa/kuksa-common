# KUKSA Common
![KUKSA Logo](./assets/logo.png)

This repository is intended to contain common files that are needed by multiple KUKSA repositories.

Content of this repository

| Content      | Location    |  Comment |
| ------------ | ----------- | ------------ |
| Official VSS releases in JSON format | [vss](./vss) | Supported by both KUKSA Databroker and KUKSA Server
| KUKSA Example keys and certificates for TLS | [tls](./tls) | Supported by both KUKSA Databroker and KUKSA Server
| KUKSA Databroker Tokens | [jwt](./jwt/) | Not supported by KUKSA Server 

*Note: The tokens supported by KUKSA Server are available in [kuksa.val](https://github.com/eclipse/kuksa.val/tree/master/kuksa_certificates/jwt) repository!*

## Usage

This repository is supposed to contain the "master version" of the artifacts stored in this repository.
Two methods to use the artifacts are listed below.

### Submodule

Repositories may include this repository as a submodule.

### File copy

Repositories may copy files stored in this repository, but if so they should preferably state
that this repository contains the "master version".

## Pre-commit set up
This repository is set up to use [pre-commit](https://pre-commit.com/) hooks.
Use `pip install pre-commit` to install pre-commit.
After you clone the project, run `pre-commit install` to install pre-commit into your git hooks.
Pre-commit will now run on every commit.
Every time you clone a project using pre-commit running pre-commit install should always be the first thing you do.
