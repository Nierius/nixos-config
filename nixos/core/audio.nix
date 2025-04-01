{ config, lib, ... }:

with lib;

mkMerge [
  {
    # Enable sound with pipewire.
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    programs.noisetorch.enable = true;
  }
  (mkIf config.enableBtHeadphones {
    hardware.pulseaudio = {
      extraModules = [ pkgs.pulseaudio-modules-bt ];
      package = pkgs.pulseaudioFull;
    };
    hardware.bluetooth = {
      enable = true;
      settings.General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  })
]

