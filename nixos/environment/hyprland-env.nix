{ pkgs, ... }:

{
  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  programs.hyprland.enable = true;

  environment.systemPackages = [
    pkgs.kitty
  ];
}
