{ pkgs, lib, ... }:

let 
  colors = import ../dracula.nix;
  toRgb = with lib.strings; str: "rgb(" + concatStringsSep ", " (splitString " " str) + ")";
in
{
  programs.broot = {
    enable = true;
    enableZshIntegration = true;
    skin = {
      default = toRgb colors.dracula.rgb.foreground + " " + toRgb colors.dracula.rgb.background;
      directory = toRgb colors.dracula.rgb.purple + " " + toRgb colors.dracula.rgb.background;
      input = "none none";
      status_normal = "none none";
      status_italic = toRgb colors.dracula.rgb.yellow + " none";
      status_bold = toRgb colors.dracula.rgb.yellow + " none";
      status_job = toRgb colors.dracula.rgb.yellow + " none";
      status_code = toRgb colors.dracula.rgb.yellow + " none";
      status_ellipsis = toRgb colors.dracula.rgb.yellow + " none";
      flag_value = toRgb colors.dracula.rgb.yellow + " none";
      flag_label = "none none";
    };
  };
}
