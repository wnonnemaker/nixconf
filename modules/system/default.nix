{ config, pkgs, ... }:
{
  home-manager.users.will = {
    imports = [
      ./audio.nix
      ./bluetooth.nix
      ./syncthing.nix
      ./locales.nix
      ./will.nix
    ];

    home.packages = with pkgs; [
      btop
      wev
      brightnessctl
      playerctl
      nerd-fonts.jetbrains-mono
    ]
  }

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
