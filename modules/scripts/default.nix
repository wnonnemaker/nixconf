{ config, pkgs, ... }:
{
  home-manager.users.will = {
    home.packages = with pkgs; [
      (writeShellScriptBin "rebuild" (builtins.readFile
      ./rebuild.sh))
      (writeShellScriptBin "tnvim" (builtins.readFile
      ./tnvim.sh))
      (writeShellScriptBin "gojournal" (builtins.readFile
      ./gojournal.sh))
      (writeShellScriptBin "gojournaldir" (builtins.readFile
      ./gojournaldir.sh))
      (writeShellScriptBin "bookmark" (builtins.readFile
      ./bookmark.sh))
      (writeShellScriptBin "getbookmark" (builtins.readFile
      ./getbookmark.sh))
      (writeShellScriptBin "addmonthlybills" (builtins.readFile
      ./addMonthlyBills.sh))
    ];
  };
}
