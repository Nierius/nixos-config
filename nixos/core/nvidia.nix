{ config, lib, ... }:

with lib;

mkMerge [
  (mkIf config.nvidiaGpuSupport {
    # Make sure opengl is enabled
    hardware.opengl = {
      enable = true;
      driSupport32Bit = true;
    };

    # NVIDIA drivers are unfree.
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "nvidia-x11"
      ];

    # Tell Xorg to use the nvidia driver
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      open = false;

      # Modesetting is needed for most wayland compositors
      modesetting.enable = true;

      # Use the open source version of the kernel module
      # Only available on driver 515.43.04+
      # open = true;

      # Enable the nvidia settings menu
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  })
]

