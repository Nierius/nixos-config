# NixOS Config

This repository contains configurations I use to setup new workstations.
The repo is using NixOS with home-manager to install wanted packages, user rights, users and so on.

## Installation

System wide NixOS configurations should be installed before home-manager.
You can find first time installation guide for NixOS configuration from [nixos/README.md](./nixos/README.md).

After system wide NixOS configuration has been taken into use home-manager can be setup with instructions located at [home-manager/README.md](./home-manager/README.md).

## Development mode

Script called "dev.sh" is included to help with developing system wide NixOS configuration.
This script can be used to change file permissions of NixOS configuration.

Usage of dev.sh script:

To start development session (take ownership of NixOS configuration for current user) use:
> ./dev.sh start

To stop development session (give ownership of NixOS configuration back to root) use:
> ./dev.sh stop

Taking ownership makes it easier to manage the configuration as you don't have to use sudo powers to modify files.
Giving ownership back to root is not mandatory and your system will run fine without it but it is good habit to keep
configuration more secure from unwanted modifications.
