{ config, pkgs, ... }:
{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.will = {
    imports = [
      ./modules/waybar.nix
      ./modules/alacritty.nix
      ./modules/git.nix
      ./modules/go.nix
      ./modules/nvim.nix
      ./modules/xdg.nix
    ];
    # This should be the same value as `system.stateVersion` in
    # your `configuration.nix` file.
    home.stateVersion = "25.11";

    xdg.configFile = {
      "niri/config.kdl" = {
	source = ./sources/config.kdl;
	force = true;
      };
    };

    home.file = {
      ".bashrc".source = ./sources/bashrc.sh;
      ".tmux.conf".source = ./sources/tmux.conf;
    };

    home.packages = with pkgs; [
      swaybg
      tmux
      nerd-fonts.jetbrains-mono
      fastfetch
      claude-code
      cmus
      pavucontrol
      typst
      go
      gcc
      cobra-cli
      hledger
      ghc
      #neovim deps
      fd
      lua54Packages.nvim-web-devicons
      ripgrep
      #end neovim deps

      #shell scripts
      (writeShellScriptBin "rebuild" (builtins.readFile
      ./sources/scripts/rebuild.sh))
      (writeShellScriptBin "nvimLink" (builtins.readFile
      ./sources/scripts/link-nvim.sh))
      #end shell scripts

      kdePackages.okular
      nodejs_24
      docker
      docker-compose
      rsync
      busybox
    ];

    nixpkgs.config.allowUnfree = true;

    services.mako.enable = true;
  };
}
