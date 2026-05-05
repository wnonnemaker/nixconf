{ config, pkgs, ... }:
{
xdg.configFile = {
  "nvim" = {
    source = ../sources/nvim;
    recursive = true;
    force = true;
  };
};

programs.neovim.plugins = [
  pkgs.lua54Packages.telescope-nvim
  pkgs.vimPlugins.telescope-fzf-native-nvim
];
}
