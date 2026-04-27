{ inputs, pkgs, ... }:
{
  programs.niri.enable = true;
  niri-flake.cache.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
	command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
        user = "greeter";
      };
    };
  };
}
