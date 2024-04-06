{ pkgs, ... }:

{
  users.users."%USER_NICK%" = {
    isNormalUser = true;
    description = "%FULL_USERNAME%";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };
}
