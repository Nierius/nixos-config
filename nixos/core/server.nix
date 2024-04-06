{ config, lib, ... }:

with lib;

mkIf config.requireServer {
  # Dont sleep
  services.logind.lidSwitchExternalPower = "ignore";
}
