# Home manager configuration

This directory contains configuration for users environment.

## Using home manager

Before taking home manager into use first time you should install the systemwide configuration with instructions at [nixos/README.md](../nixos/README.md)

To generate your configuration and symlink it to '~/.config/home-manager' you can use following command

> ./configure.sh

This command will write your current username into configurations and add symlink to before mentioned directory.
If you modify home-manager configuration then you should re-run 'configure.sh'. Modifying of the configuration should only be done
in this directory to avoid overriding your changes.

After you have generated your configuration:
Home manager configuration can be taken into use with command 

> home-manager switch

This command will rebuild user environment and take it into use right away.
