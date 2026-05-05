{ config, pkgs, ... }:
{
xdg.configFile = {
  "nvim" = {
    source = ../sources/nvim;
    recursive = true;
    force = true;
  };
};

programs.neovim.enable = true;

programs.neovim.plugins = with pkgs.vimPlugins; [
    telescope-nvim
    telescope-fzf-native-nvim
    plenary-nvim
];
}
