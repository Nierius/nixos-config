{ config, lib, ... }:

with lib;

mkIf config.requireDocker {
  # Enable docker
  virtualisation.docker.enable = true;
}
