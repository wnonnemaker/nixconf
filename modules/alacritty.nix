{ pkgs, ... }:
{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    general.import = [ "${pkgs.alacritty-theme}/high_contrast.toml" ];

    colors.normal.blue = "#82aaff";

    env.TERM = "xterm-256color";

    window.opacity = 0.9;

    font.size = 12;

    keyboard.bindings = [
      { key = "d"; mods = "Alt|Shift"; action = "SpawnNewInstance"; }
      { key = "q"; mods = "Alt"; action = "IncreaseFontSize"; }
      { key = "w"; mods = "Alt"; action = "DecreaseFontSize"; }
    ];
  };
}
