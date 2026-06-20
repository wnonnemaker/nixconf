{ config, pkgs, ... }:
{

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
			tailwindcss
			cargo
			triton-llvm
			opam
			opencode
    ];
  };
	imports = [
			./pi.nix
	];

  environment.systemPackages = with pkgs; [
    haskellPackages.brainfuck 
  ];

  programs.git.enable = true;
  virtualisation.docker.enable = true;
}
