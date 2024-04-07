# NixOS Configuration

This directory contains configuration for the whole NixOS operating system.

## First time installation

To make this configuration reusable some parts of end configuration have been left out on purpose.
These parts are boot configuration and hardware configuration. The baseline for those configurations
are automatically generated on the installation of NixOS. Only copying those configurations here is left to do for you.

1. Copy hardware-configuration.nix
> cp /etc/nixos/hardware-configuration.nix .

2. Copy all configuration entries starting with "boot." from /etc/nixos/configuration.nix to [core/boot.nix](./core/boot.nix)

3. Generate configurations with command
> ./configure.sh

4. Take generated configuration into use
> sudo nixos-rebuild switch -I nixos-config=/home/YOUR_USER_NAME_HERE/.config/nixos/configuration.nix

NOTE: This is the only time you will need the -I tag. After you have taken home-manager into use you can use this command instead
> sudo nixos-rebuild-pathed switch

## Modifying configuration

You can modify the configuration to your liking in this directory. To take new configuration for a spin use following commands
> ./configure.sh

> sudo nixos-rebuild-pathed switch

If you find yourself modifying configuration often and inputting hostname etc gets tedious you can
copy configure.sh to .configure.sh and replace read commands with variable definitions.

For example
> read -p "Hostname: " hostname

Could be replaced with
> hostname="laptop1"

