{ pkgs, lib, ... }:

let 
  colors = import ../themes/dracula.nix;
  toRgb = with lib.strings; str: "rgb(" + concatStringsSep ", " (splitString " " str) + ")";
in
{
  programs.broot = {
    enable = true;
    enableZshIntegration = true;
    skin = with colors.dracula.rgb; {
      default = toRgb foreground + " " + toRgb background;
      directory = toRgb purple + " " + toRgb background;
      input = "none none";
      status_normal = "none none";
      status_italic = toRgb yellow + " none";
      status_bold = toRgb yellow + " none";
      status_job = toRgb yellow + " none";
      status_code = toRgb yellow + " none";
      status_ellipsis = toRgb yellow + " none";
      flag_value = toRgb yellow + " none";
      flag_label = "none none";
    };
    verbs = [
      { 
        key = "ctrl-h";
        internal = ":panel_left";
      }
      { 
        key = "ctrl-j";
        internal = ":line_down";
      }
      { 
        key = "ctrl-k";
        internal = ":line_up";
      }
      { 
        key = "ctrl-l";
        internal = ":panel_right";

      }
    ];
  };
}
