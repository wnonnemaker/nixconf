{ config, pkgs, ... }:
{
xdg.configFile = {
  "nvim" = {
    source = ./nvim;
    recursive = true;
    force = true;
  };
};

programs.neovim = {
  enable = true;
  withRuby = false;
  withPython3 = false;
};

programs.neovim.plugins = with pkgs.vimPlugins; [
  telescope-nvim
  telescope-fzf-native-nvim
  plenary-nvim
  nvim-treesitter.withAllGrammars
  vim-svelte
  nvim-autopairs
  tokyonight-nvim
  catppuccin-nvim
  gruvbox-nvim
  rose-pine
  kanagawa-nvim
  nord-nvim
  onedark-nvim
  zen-mode-nvim
];
}
