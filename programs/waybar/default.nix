{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 20;
        spacing = 4;
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "idle_inhibitor" "pulseaudio" "network" "cpu" "memory" "temperature" "backlight" "keyboard-state" "sway/language" "battery" "clock" "tray" ];
        # left
        "sway/workspaces" = {
          "disable-scroll" = true;
          "all-outputs" = true;
          "format" = "{name}: {icon}";
          "format-icons" = {
            "1: web" = "";
            "2: terms" = "󰞷";
            "3: files" = "";
            "4: system" = "";
            "5: music" = "󰓇";
            "urgent" = "";
            "focused" = "";
            "default" = "";
          };
        };
        "sway/mode" = {
          format = "{}";
          max-length = 50;
        };

        # right
        "keyboard-state" = {
          "numlock" = true;
          "capslock" = true;
          "format" = "{name} {icon}";
          "format-icons" = {
            "locked" = "";
            "unlocked" = "";
          };
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
        };
        "tray" = {
          "spacing" = 10;
        };
        "clock" = {
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = "{:%d-%m-%Y}";
        };
        "cpu" = {
          "format" = "{usage}% ";
          "tooltip" = false;
        };
        "memory" = {
          "format" = "{}% ";
        };
        "temperature" = {
          "critical-threshold" = 80;
          "format" = "{temperatureC}°C {icon} ";
          "format-icons" = [ "" "" ];
        };
        "backlight" = {
          "format" = "{percent}% {icon}";
          "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
        };
        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon}  {capacity}%";
          "format-charging" = "󰂄 {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{time} {icon}";
          "format-icons" = [ "" "" "" "" "" ];
        };
        "network" = {
          "format-wifi" = "{essid} ({signalStrength}%) ";
          "format-ethernet" = "{ipaddr}/{cidr} 󰈀";
          "tooltip-format" = "{ifname} via {gwaddr}";
          "format-linked" = "{ifname} (No IP)";
          "format-disconnected" = "Disconnected ⚠";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };
        "pulseaudio" = {
          "format" = "{volume}% {icon} {format_source}";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = "󰝟 {format_source}";
          "format-source" = "{volume}% ";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" "" ];
          };
          "on-click" = "pavucontrol";
        };
      };
    };
    style = ''
      @define-color background rgb(40, 42, 54);
      @define-color current-line rgb(68, 71, 90);
      @define-color foreground rgb(248, 248, 242);
      @define-color comment rgb(98, 114, 164);
      @define-color cyan rgb(139, 233, 253);
      @define-color green rgb(80, 250, 123);
      @define-color orange rgb(255, 184, 108);
      @define-color pink rgb(255, 121, 198);
      @define-color purple rgb(189, 147, 249);
      @define-color red rgb(255, 85, 85);
      @define-color yellow rgb(241, 250, 140);

      * {
          border:        none;
          border-radius: 0;
          font-family:   'FiraCode Nerd Font';
          font-size:     12px;
          box-shadow:    none;
          text-shadow:   none;
          transition-duration: 0s;
      }

      window {
          color:      @forground;
          background: @background;
      }

      #workspaces {
          margin: 0 5px;
      }

      #workspaces button {
          padding:    0 5px;
      }

      #workspaces button:hover {
          background: @background;
      }

      #workspaces button.visible {
          color:      @yellow;
      }

      #workspaces button.focused {
          color:      @purple;
      }

      #workspaces button.urgent {
          color:      @orange;
      }

      #mode, #battery, #cpu, #memory, #network, #pulseaudio, #idle_inhibitor, #backlight, #custom-storage, #custom-spotify, #custom-weather, #custom-mail {
          margin:     0px 6px 0px 10px;
          min-width:  25px;
      }

      #pulseaudio {
          color: @purple;
      }

      #cpu {
          color: @purple;
      }

      #clock {
          margin:     0px 16px 0px 10px;
          min-width:  140px;
          color: @orange;
      }

      #battery.warning {
          color:       @orange;
      }

      #battery.critical {
          color:      @red;
      }

      #battery.charging {
          color: @purple;
      }

      #custom-storage.warning {
          color:      rgba(255, 210, 4, 1);
      }

      #custom-storage.critical {
          color:      rgba(238, 46, 36, 1);
      }
    '';
  };
}
