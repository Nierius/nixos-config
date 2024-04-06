{ config, lib, ... }:

with lib;

{
  options = {
    enableMinecraftServer = mkOption {
      default = "%ENABLE_MC_SERVER%";
      type = types.bool;
    };
    enableValheimServer = mkOption {
      default = "%ENABLE_VALHEIM_SERVER%";
      type = types.bool;
    };
    enableBtHeadphones = mkOption {
      default = "%BLUETOOTH_AUDIOSINK_SUPPORT%";
      type = types.bool;
    };
    requireServer = mkOption {
      default = false;
      type = types.bool;
    };
    requireDocker = mkOption {
      default = false;
      type = types.bool;
    };
    enableRemoting = mkOption {
      default = "%ENABLE_REMOTE_ACCESS%";
      type = types.bool;
    };
    amdGpuSupport = mkOption {
      default = "%AMD_GPU_SUPPORT%";
      type = types.bool;
    };
    amdGpuKernelModule = mkOption {
      default = "%USE_AMD_GPU_KERNEL_MODULE%";
      type = types.bool;
    };
  };

  config = {
    requireServer = config.enableMinecraftServer || config.enableValheimServer;
    requireDocker = config.requireServer;
  };
}
