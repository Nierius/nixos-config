{ pkgs, config, lib, ... }:

with lib;

mkIf config.requireDocker {
  # Enable docker
  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
