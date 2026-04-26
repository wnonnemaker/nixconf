{ config, pkgs, ... }:
{
  programs.niri = {
    settings = {
	/*
      spawn-at-startup = [
      { command = [ "waybar" ]; }
      ];
	*/
      # key bindings, outputs, animations, etc.
      # options mirror the niri config file format
      binds = {
        "Alt+Shift+Return".action.spawn = "alacritty";
	"Alt+D".action.spawn = "fuzzel";
	"Alt+J".action = { focus-window-up = {};};
	"Alt+K".action = { focus-window-down = {};};
	"Alt+H".action = { focus-column-left = {};};
	"Alt+L".action = { focus-column-right = {};};
	"Alt+Q".action = { close-window = {};};
	"Alt+F".action = { maximize-column = {};};
	"Alt+Shift+E".action = { quit = {}; };
      };
    };
  };
}
