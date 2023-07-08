{ config, pkgs, lib, ... }:
let
  colors = import ../../themes/dracula.nix;
in
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      left = "h";
      down = "j";
      up = "k";
      right = "l";

      modifier = "Mod4";

      terminal = "${pkgs.kitty}/bin/kitty";
      menu = "${pkgs.bemenu}/bin/bemenu-run";

      input = {
        "1267:12572:VEN_04F3:00_04F3:311C_Touchpad" = {
          tap = "enabled";
          dwt = "enabled";
          natural_scroll = "enabled";
          middle_emulation = "enabled";
        };
        "1:1:AT_Translated_Set_2_keyboard" = {
          xkb_layout = "us";
          xkb_variant = "colemak_dh";
        };
        "type:keyboard" = {
          xkb_options = "caps:ctrl_modifier";
        };
      };

      fonts = {
        names = [ "FiraCode Nerd Font" ];
        size = 11.0;
      };

      bars = [ ];

      defaultWorkspace = "workspace number 1";

      workspaceAutoBackAndForth = true;

      hideEdgeBorders = "smart";

      assigns = {
        "1: web" = [ ];
        "2: terms" = [ ];
        "3: files" = [ ];
        "4: system" = [ ];
        "5: music" = [ ];
      };

      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
          ws1 = "1: web";
          ws2 = "2: terms";
          ws3 = "3: files";
          ws4 = "4: system";
          ws5 = "5: music";
        in
        lib.mkOptionDefault {
          "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";
          "${modifier}+Shift+q" = "kill";

          "${modifier}+1" = "workspace ${ws1}";
          "${modifier}+2" = "workspace ${ws2}";
          "${modifier}+3" = "workspace ${ws3}";
          "${modifier}+4" = "workspace ${ws4}";
          "${modifier}+5" = "workspace ${ws5}";

          "${modifier}+Shift+1" = "move container to workspace ${ws1}";
          "${modifier}+Shift+2" = "move container to workspace ${ws2}";
          "${modifier}+Shift+3" = "move container to workspace ${ws3}";
          "${modifier}+Shift+4" = "move container to workspace ${ws4}";
          "${modifier}+Shift+5" = "move container to workspace ${ws5}";

          "${modifier}+Shift+y" = "move scratchpad";
          "${modifier}+y" = "scratchpad show";

          "${modifier}+Shift+c" = "reload";
          "${modifier}+p" = "exec ${pkgs.clipman}/bin/clipman pick --tool=bemenu";
          "${modifier}+q" = "exec ${pkgs.swaylock}/bin/swaylock -lk";
        };

      colors = with colors.dracula.hex; {
        background = foreground;
        focused = {
          border = comment;
          background = comment;
          text = foreground;
          indicator = comment;
          childBorder = comment;
        };
      };
    };
    extraOptions = [
      "--unsupported-gpu"
    ];
  };
} 
