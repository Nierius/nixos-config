{ lib, pkgs, config, ... }:

with lib;

mkMerge[
  {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    environment.gnome.excludePackages = (with pkgs; [
      gnome-photos
      gnome-tour
    ]) ++ (with pkgs.gnome; [
      cheese # webcam
      gnome-music
      gnome-terminal
      gedit
      epiphany
      geary # email
      # evince # document viewer
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
    ]);

    environment.systemPackages = with pkgs; [
      gnomeExtensions.just-perfection
    ];
  }
  (mkIf config.nvidiaGpuSupport {
    # Nvidia glitches on wayland :/
    services.xserver.displayManager.gdm.wayland = false;
    # --
  })
]

