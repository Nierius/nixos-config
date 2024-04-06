{ config, lib, ... }:

with lib;

mkMerge [
  (mkIf config.amdGpuKernelModule {
    boot.initrd.kernelModules = [ "amdgpu" ];
  })
  (mkIf config.amdGpuSupport {
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "amdgpu" ];
  })
]

