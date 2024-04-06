{ config, lib, ... }:

with lib;

mkIf config.enableRemoting {
  networking.firewall.allowedTCPPorts = [ 3389 ];
}
