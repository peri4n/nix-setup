{ pkgs, ... }:

let colors = import ../themes/dracula.nix;
in {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    colors = with colors.dracula.hex; {
      fg = foreground;
      "fg+" = foreground;
      bg = background;
      "bg+" = selection;
      hl = purple;
      "hl+" = purple;
      info = orange;
      marker = pink;
      prompt = green;
      spinner = orange;
      pointer = pink;
      header = comment;
    };
    defaultCommand = "${pkgs.fd}/bin/fd --type f";
    defaultOptions = [ "--height 40%" ];
    fileWidgetCommand = "${pkgs.fd}/bin/fd --type f";
    fileWidgetOptions =
      [ "--preview 'bat --style=numbers --color=always --line-range :500 {}'" ];
  };
}
