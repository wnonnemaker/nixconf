{ config, pkgs, ... }:
{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.will = {
    imports = [
      ./modules/alacritty.nix
      ./modules/git.nix
      ./modules/go.nix
      ./modules/nvim.nix
      ./modules/bash.nix
    ];
    # This should be the same value as `system.stateVersion` in
    # your `configuration.nix` file.
    home.stateVersion = "25.11";


    home.packages = with pkgs; [
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
      fastfetch
      claude-code
      #shell scripts
      #end shell scripts
      nodejs_24
      docker
      docker-compose
      rsync
      busybox #random utils (lsusb, diff, awk, etc.)
      lf
      brave
      firefox
    ];

    nixpkgs.config.allowUnfree = true;

    services.mako.enable = true;
  };
}
