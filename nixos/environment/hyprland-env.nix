{ pkgs, ... }:

{
  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  programs.hyprland.enable = true;
  services.blueman.enable = true;

  security.pam.services.hyprlock = { };

  environment.systemPackages = [
    pkgs.kitty # Terminal
    pkgs.pavucontrol # Sound control
    pkgs.wl-clipboard # Clipboard (for screenshot mainly)
    pkgs.grim # Screenshot 1/2
    pkgs.slurp # Screenshot 2/2
    pkgs.dunst # Notifications
    pkgs.blueman # Bluetooth
    pkgs.rofi-wayland # Application launcher
    pkgs.waybar # Bar
    pkgs.hyprlock # Lock
    pkgs.hypridle # Idle
  ];
}
