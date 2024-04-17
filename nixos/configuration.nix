{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./variables.nix
      ./core/boot.nix
      ./core/audio.nix
      ./core/amd.nix
      ./core/global-packages.nix
      ./core/server.nix
      ./core/docker.nix
      ./core/nvidia.nix
      ./environment/gnome-env.nix
      ./environment/hyprland-env.nix
      ./environment/firewall.nix
      ./environment/locales.nix
      ./environment/users.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.nix-ld.enable = true;

  networking.hostName = "%HOST_NAME%";
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  system.stateVersion = "23.05";
}
