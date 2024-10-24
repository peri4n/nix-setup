{ pkgs, ... }: {
  services.kanshi = {
    enable = true;
    profiles = {
      docked = {
        outputs = [
          {
            criteria = "LG Electronics LG ULTRAWIDE 0x000087DC";
            status = "enable";
            mode = "3440x1440";
            position = "0,0";
            scale = 1.0;
          }
          {
            criteria = "eDP-1";
            status = "disable";
          }
        ];
        exec =
          "${pkgs.libnotify}/bin/notify-send 'Switched to DOCKED environment'";
      };

      undocked = {
        outputs = [{
          criteria = "eDP-1";
          status = "enable";
          scale = 1.5;
          mode = "3840x2400";
          position = "0,0";
        }];
        exec =
          "${pkgs.libnotify}/bin/notify-send 'Switched to UNDOCKED environment'";
      };
    };
  };
}
