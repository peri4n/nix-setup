{ config, pkgs, lib, ... }:
let
  colors = import ../../themes/dracula.nix;
  ws1 = "1: web";
  ws2 = "2: terms";
  ws3 = "3: files";
  ws4 = "4: system";
  ws5 = "5: music";
  loadNotes = "${pkgs.kitty}/bin/kitty --class=kitty_daily --session=$HOME/.config/kitty/daily.conf";
in
{
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    config = {
      left = "h";
      down = "j";
      up = "k";
      right = "l";

      modifier = "Mod4";

      terminal = "${pkgs.kitty}/bin/kitty";
      menu = "${pkgs.bemenu}/bin/bemenu-run";

      input = {
        "type:touchpad" = {
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
          xkb_options = "caps:ctrl_modifier,compose:ralt";
        };
      };

      fonts = {
        names = [ "FiraCode Nerd Font" ];
        size = 11.0;
      };

      bars = [ ];

      defaultWorkspace = "workspace number 1";

      workspaceAutoBackAndForth = true;

      window.hideEdgeBorders = "smart";

      assigns = {
        "${ws1}" = [{ class = "^Brave-browser$"; }];
        "2: terms" = [{ app_id = "^kitty$"; }];
        "3: files" = [{ app_id = "^broot$"; }];
        "4: system" = [{ app_id = "^btop$"; }];
        "5: music" = [{ class = "^Spotify$"; }];
      };

      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
        in
        lib.mkOptionDefault {
          "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";
          "${modifier}+Shift+x" = "kill";

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
          "${modifier}+comma" = "exec ${pkgs.buku}/bin/buku -p -f 3 | ${pkgs.gnused}/bin/sed 's/\t/ /g' | ${pkgs.bemenu}/bin/bemenu -i -l 10 | ${pkgs.coreutils}/bin/cut -d ' ' -f 1 | ${pkgs.findutils}/bin/xargs --no-run-if-empty ${pkgs.buku}/bin/buku -o";
          "${modifier}+t" = "[app_id=\"kitty_daily\"] scratchpad show";
          "${modifier}+Shift+t" = "exec ${loadNotes}";

          "${modifier}+Shift+c" = "reload";
          "${modifier}+p" = "exec ${pkgs.clipman}/bin/clipman pick --tool=bemenu";
          "${modifier}+Shift+q" = "exec ${pkgs.swaylock}/bin/swaylock -lk";
          "${modifier}+n" = "exec ${pkgs.bemenu}/bin/bemenu-run ";
          "${modifier}+c" = "exec ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | ${pkgs.swappy}/bin/swappy -f - -o ~/$(date +'%H_%M_%S.png')";
        };

      startup = [
        {
          command = loadNotes;
        }
        {
          command = "${pkgs.swaycons}/bin/swaycons";
        }
        {
          command = "${pkgs.swaybg}/bin/swaybg -i ${../swaylock/lake-wallpaper.jpg}";
        }
        {
          command = "${pkgs.brave}/bin/brave";
        }
        {
          command = "${pkgs.kitty}/bin/kitty --class broot -e broot";
        }
        {
          command = "${pkgs.kitty}/bin/kitty --class btop -e btop";
        }
      ];

      colors = with colors.dracula.hex; {
        background = foreground;

        focused = {
          border = comment;
          background = comment;
          text = foreground;
          indicator = comment;
          childBorder = comment;
        };

        focusedInactive = {
          border = selection;
          background = selection;
          text = foreground;
          indicator = selection;
          childBorder = selection;
        };

        unfocused = {
          border = background;
          background = background;
          text = light_gray;
          indicator = background;
          childBorder = background;
        };

        urgent = {
          border = selection;
          background = red;
          text = foreground;
          indicator = red;
          childBorder = background;
        };

        placeholder = {
          border = background;
          background = background;
          text = foreground;
          indicator = background;
          childBorder = background;
        };
      };
    };

    xwayland = true;

    wrapperFeatures = {
      base = true;
      gtk = true;
    };

    extraOptions = [
      "--unsupported-gpu"
    ];

    extraConfig = ''
      for_window [app_id="bookmarks_launcher"] floating enable, floating_minimum_size 2000 x 800, floating_maximum_size 2000 x 800, border none

      for_window [app_id="kitty_daily"] move to scratchpad


      set $WOBSOCK $XDG_RUNTIME_DIR/wob.sock
      exec rm -f $WOBSOCK && mkfifo $WOBSOCK && tail -f $WOBSOCK | wob

      # Brightness
      bindsym XF86MonBrightnessUp exec light -A 5 && light -G | cut -d'.' -f1 > $WOBSOCK
      bindsym XF86MonBrightnessDown exec light -U 5 && light -G | cut -d'.' -f1 > $WOBSOCK

      # Volume
      bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | head -n 1| awk '{print substr($5, 1, length($5)-1)}' > $WOBSOCK
      bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{print substr($5, 1, length($5)-1)}' > $WOBSOCK
      bindsym XF86AudioMute exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'

      exec_always "systemctl --user restart kanshi.service"
    '';
  };
} 
