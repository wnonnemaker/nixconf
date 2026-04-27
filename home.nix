{ config, pkgs, ... }:
{
    imports = [
	<home-manager/nixos>
    ];

    home-manager.users.will = {
        # This should be the same value as `system.stateVersion` in
        # your `configuration.nix` file.
        home.stateVersion = "25.11";
	home.file = {
		".foorc" = {
		    text = ''
			Hello, world!
		    '';
		};
    	};
    };
}
