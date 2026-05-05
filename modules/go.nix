{ config, pkgs, ... }:
{
  programs.go = {
    enable = true;
    env = {
      GOPATH="${config.home.homeDirectory}/.go";
    };
  };
}
