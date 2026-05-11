{ config, pkgs, ... }:
let 
  desk = "${config.home.homeDirectory}/desktop";
in
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;  # auto-creates them if they don't exist
    download = "${desk}/downloads";
    pictures = "${desk}/pictures";
    # others you might want to set:
    desktop = "${desk}/documents";
    documents = "${desk}/documents";
    music = "${desk}/music";
    videos = "${desk}/videos";
    templates = "${desk}/templates";
    publicShare = "${desk}/public";
    setSessionVariables = false;
  };
}
