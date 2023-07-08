{ config, pkgs, lib, ... }:

let
  background = "#282a36";
  foreground = "#6272a4";
  frame_color = "#ff5555";
  normal_foreground = "#bd93f9";

  critical_background = "#ff5555";
  critical_foreground = "#f8f8f2";
  critical_frame_color = "#ff5555";
in
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";

        # Geometry
        width = 300;
        height = 300;
        origin = "top-right";
        offset = "10x50";
        scale = 0;
        notification_limit = 0;

        # Progress bar
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;

        indicate_hidden = "yes";
        transparency = 15;
        idle_threshold = 120;

        # Separator
        separator_height = 1;
        padding = 8;
        horizontal_padding = 10;
        frame_color = "${background}";
        separator_color = "frame";

        # Text
        font = "Fira Code 10";
        line_height = 0;
        markup = "full";
        format = "%s %p\\n%b";
        alignment = "left";
        vertical_alignment = "center";

        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";

        # Icons
        icon_position = "left";
        min_icon_size = 0;
        max_icon_size = 64;

        # History
        sticky_history = "yes";
        history_length = 20;

        # Misc
        title = "Dunst";
        class = "Dunst";
        corner_radius = 0;
      };
      urgency_low = {
        timeout = 10;
        foreground = "${foreground}";
        background = "${background}";
      };
      urgency_normal = {
        timeout = 10;
        foreground = "${normal_foreground}";
        background = "${background}";
      };
      urgency_critical = {
        timeout = 0;
        foreground = "${critical_foreground}";
        background = "${critical_background}";
        frame_color = "${critical_frame_color}";
      };
    };
  };
}
