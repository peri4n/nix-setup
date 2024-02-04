{ config, pkgs, lib, ... }:
let
  colors = import ../../themes/dracula.nix;
in
{
  programs.zathura = {
    enable = true;
    options = with colors.dracula.hex; {
      window-title-basename = true;
      selection-clipboard = "clipboard";

      notification-error-bg = red;
      notification-error-fg = foreground;
      notification-warning-bg = orange;
      notification-warning-fg = selection;
      notification-bg = background;
      notification-fg = foreground;

      completion-bg = background;
      completion-fg = comment;
      completion-group-bg = background;
      completion-group-fg = comment;
      completion-highlight-bg = selection;
      completion-highlight-fg = foreground;

      index-bg = background;
      index-fg = foreground;
      index-active-bg = currentLine;
      index-active-fg = foreground;

      inputbar-bg = background;
      inputbar-fg = foreground;
      statusbar-bg = background;
      statusbar-fg = foreground;

      highlight-color = orange;
      highlight-active-color = pink;

      default-bg = background;
      default-fg = foreground;

      render-loading = true;
      render-loading-fg = background;
      render-loading-bg = foreground;

      recolor-lightcolor = background;
      recolor-darkcolor = foreground;

      adjust-open = "height";
    };
  };
}
