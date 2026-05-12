{ config, pkgs, ... }:
{
	imports = [
		./ollama.nix
	];

  home-manager.users.will = {
    imports = [
      ./go.nix
      ./git.nix
			./haskell.nix
    ];

    home.packages = with pkgs; [
      claude-code
      go
      gcc
      cobra-cli
      hledger
      ghc
      nodejs_24
      docker-compose
    ];
  };

  programs.git.enable = true;
  virtualisation.docker.enable = true;
}
