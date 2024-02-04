{ config, pkgs, lib, ... }:
let
  colors = import ../../themes/dracula.nix;
  dropHashTag = color: lib.substring 1 10 color;
in
{
  services.wob = {
    enable = true;
    settings = with colors.dracula.hex; {
      "" = {
        margin = 50;
        anchor = "bottom center";
        background_color = dropHashTag background;
        bar_color = dropHashTag purple;
        border_color = dropHashTag purple;
        overflow_background_color = dropHashTag background;
        overflow_bar_color = dropHashTag pink;
        overflow_border_color = dropHashTag purple;
      };
      "style.muted" = {
        bar_color = dropHashTag comment;
        overflow_bar_color = dropHashTag comment;
      };
    };
  };
}
