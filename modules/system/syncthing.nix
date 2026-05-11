{ config, pkgs, ... }:
{
  home-manager.users.will.services.syncthing = {
    enable = true;
    guiAddress = "127.0.0.1:8384";
  };

  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
