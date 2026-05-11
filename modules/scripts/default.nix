{ config, pkgs, ... }:
{
  home-manager.users.will = {
    home.packages = with pkgs; [
      (writeShellScriptBin "rebuild" (builtins.readFile
      ./rebuild.sh))
      (writeShellScriptBin "tnvim" (builtins.readFile
      ./tnvim.sh))
    ];
  };
}
