{ config, pkgs, ... }:
{
  home-manager.users.will = {
    imports = [
      ./audio.nix
      ./bluetooth.nix
      ./syncthing.nix
      ./locales.nix
    ];

    home.packages = with pkgs; [
      (writeShellScriptBin "rebuild" (builtins.readFile
      ./rebuild.sh))
      (writeShellScriptBin "tnvim" (builtins.readFile
      ./tnvim.sh))
    ]
  }
}
