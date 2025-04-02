{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    firefox
    home-manager
  ];

  services.udev.packages = with pkgs; [
    via
  ];
}
