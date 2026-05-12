{ config, pkgs, ... }:
{

  home-manager.users.will = {
    imports = [
      ./alacritty.nix
      ./bash.nix
      ./nvim.nix
    ];

    home.file = {
      ".tmux.conf".source = ./tmux.conf;
    };

    home.packages = with pkgs; [
      #neovim deps
      lua54Packages.nvim-web-devicons
      tmux
			direnv
    ];
  };
}
