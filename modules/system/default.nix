{ config, pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./syncthing.nix
    ./locales.nix
    ./will.nix
  ];

  home-manager.users.will = {
    home.packages = with pkgs; [
      #this is like catch all packages idk
      btop
      wev
      brightnessctl
      playerctl 
      rsync
      busybox #random utils (lsusb, diff, awk, etc.)
      lf
      brave
      firefox
      nerd-fonts.jetbrains-mono # who uses this?
      cmus
      pavucontrol
      typst
      fd
      ripgrep
      fastfetch
    ];
  };

  environment.systemPackages = with pkgs; [
    vim 
    wget
  ];

  # nixos configs
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
