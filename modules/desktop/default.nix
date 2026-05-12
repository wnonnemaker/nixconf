{ config, pkgs, ... }:
{
  programs.niri.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
	command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
        user = "greeter";
      };
    };
  };


  home-manager.users.will = {
    imports = [
      ./waybar.nix
      ./xdg.nix
    ];

    xdg.configFile = {
      "niri/config.kdl" = {
				source = ./config.kdl;
				force = true;
      };
    };

    home.packages = with pkgs; [
      kdePackages.okular
      kdePackages.ocean-sound-theme
      swaybg
      wl-clipboard
      xwayland-satellite
      fuzzel
    ];

    services.mako.enable = true;
  };
}
