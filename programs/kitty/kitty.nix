{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      include dracula.conf
    '';
    settings = {
      font_family = "Fira Code Nerd Font";
      tab_bar_style = "powerline";
      disable_ligatures = "cursor";
      enable_audio_bell = "no";
      enabled_layouts = "tall";
      window_border_width = "0.5pt";
      linux_display_server = "wayland";
    };
    keybindings = {
      "kitty_mod+t" = "new_tab_with_cwd";
    };
  };

  xdg.configFile."kitty/dracula.conf".source = ./dracula.conf;
  xdg.configFile."kitty/diff.conf".source = ./diff.conf;
  xdg.configFile."kitty/open-actions.conf".source = ./open-actions.conf;
}
