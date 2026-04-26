{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [ "niri/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "battery" ];
        "clock" = {
          format = "{:%H:%M}";
          tooltip-format = "{:%Y-%m-%d}";
        };
        # ...
      };
    };
    style = ''
      * { font-family: "JetBrains Mono"; }
      window#waybar { background: #1e1e2e; }
      /* etc. */
    '';
  };
}
