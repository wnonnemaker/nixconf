{ config, inputs, pkgs, ... }:
{
  imports = [
		inputs.whisper-dictation.packages.${system}.default
  ];

	systemd.user.services.whisper-dictation = {
			enable = true;
			wantedBy = [ "graphical-session.target" ];
	};
}
