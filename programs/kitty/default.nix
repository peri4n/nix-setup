{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    theme = "Dracula";
    settings = {
      font_size = "11.0";
      font_family = "Fira Code Nerd Font";
      bold_font = "Fira Code Nerd Font";
      italic_font = "Hasklug Nerd Font";
      bold_italic_font = "Hasklug Nerd Font";
      tab_bar_style = "powerline";
      disable_ligatures = "cursor";
      enable_audio_bell = "no";
      enabled_layouts = "tall, stack";
      window_border_width = "0.5pt";
      linux_display_server = "wayland";
      copy_on_select = "yes";
      background_opacity = "0.95";
    };
    keybindings = {
      "kitty_mod+t" = "new_tab_with_cwd";
    };
    shellIntegration = {
      mode = "enabled";
      enableZshIntegration = true;
    };
  };

  xdg.configFile."kitty/diff.conf".source = ./diff.conf;
  xdg.configFile."kitty/daily.conf".source = ./daily.conf;
  xdg.configFile."kitty/open-actions.conf".source = ./open-actions.conf;
}
