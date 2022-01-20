{ config, ... }:

{
  services = {
    picom = {
      enable = true;
      backend = "xrender";
      shadow = true;
      shadowOffsets = [ (-7) (-7) ];
      shadowExclude = [
        "name = 'Notification'"
        "class_g = 'Conky'"
        "class_g ?= 'Notify-osd'"
        "class_g = 'Cairo-clock'"
        "_GTK_FRAME_EXTENTS@:c"
      ];
      blur = true;
      blurExclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "_GTK_FRAME_EXTENTS@:c"
      ];
      fade = true;
      fadeSteps = [ "0.06" "0.06" ];
      refreshRate = 0;
      vSync = true;
      inactiveOpacity = "0.8";
      noDockShadow = true;
      noDNDShadow = true;
      menuOpacity = "0.8";
    };
  };
}
