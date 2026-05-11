{ config, pkgs, ... }:
{
  users.users.will = {
    isNormalUser = true;
    home = "/home/will";
    description = "Will Nonnemaker";
    extraGroups = [ "video" "docker" "wheel" "networkmanager" ];
  };
}
