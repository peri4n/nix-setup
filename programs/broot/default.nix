{ pkgs, lib, ... }:

let
  colors = import ../themes/dracula.nix;
  toRgb = with lib.strings;
    str:
    "rgb(" + concatStringsSep ", " (splitString " " str) + ")";
in {
  programs.broot = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      imports = [
        "verbs.hjson"
        {
          file = "skins/dracula.hjson";
          luma = [ "dark" "unknown" "light" ];
        }
      ];
      verbs = [
        {
          key = "ctrl-h";
          internal = ":panel_left";
        }
        {
          key = "ctrl-n";
          internal = ":line_down";
        }
        {
          key = "ctrl-p";
          internal = ":line_up";
        }
        {
          key = "ctrl-l";
          internal = ":panel_right";

        }
      ];
    };
  };
  xdg.configFile."broot/skins/dracula.hjson".source = ./dracula.hjson;
}
