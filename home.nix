{ config, pkgs, ... }:
{
    imports = [
	<home-manager/nixos>
    ];

    home-manager.users.will = {
	imports = [
		./modules/waybar.nix
		./modules/alacritty.nix
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
	];

  	nixpkgs.config.allowUnfree = true;

	services.mako.enable = true;
    };
}
