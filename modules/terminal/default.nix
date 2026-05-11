{ config, pkgs, ... }:
{

  home-manager.users.will = {
    imports = [
      ./alacritty.nix
      ./bash.nix
      ./nvim.nix
    ];

    home.file = {
      ".tmux.conf".source = ./sources/tmux.conf;
    };

    home.packages = with pkgs; [
    ]
  }
}
