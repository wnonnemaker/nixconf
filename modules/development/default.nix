{ config, pkgs, ... }:
{
  home-manager.users.will = {
    imports = [
      ./go.nix
      ./git.nix
    ];

    home.packages = with pkgs; [
      claude-code
      docker-compose
    ]
  }

  programs.git.enable = true;
  virtualisation.docker.enable = true;
}
