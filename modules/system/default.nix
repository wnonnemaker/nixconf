{ config, pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./syncthing.nix
    ./locales.nix
    ./will.nix
		./cron.nix
  ];

  home-manager.users.will = {
    home.packages = with pkgs; [
      #this is like catch all packages idk
      btop
      wev #key input detector
      brightnessctl
      playerctl 
      rsync
      #busybox #random utils (lsusb, diff, awk, etc.) this guy had some weird
			#behavior
      lf
      inotify-tools
      brave
      firefox
      nerd-fonts.jetbrains-mono # who uses this?
      cmus
      pavucontrol
      typst
      fd
      ripgrep
      fastfetch
			openssl
			hugo
			python3
			imagemagick
			baobab
			wtype
			fzf
			libnotify
    ];
  };

  environment.systemPackages = with pkgs; [
    vim 
    wget
  	(aspellWithDicts (dicts: with dicts; [en en-computers en-science]))
  ];

  networking.networkmanager.enable = true;

  # nixos configs
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
