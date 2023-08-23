{ config, pkgs, lib, ... }:
{
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -k";
      }
      # {
      #   event = "after-resume";
      #   command = "${pkgs.sway}/bin/swaymsg 'output * enable'";
      # }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -k";
      }
      # {
      #   timeout = 600;
      #   command = "${pkgs.sway}/bin/swaymsg 'output * dpms off'";
      #   resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
      # }
    ];
  };
}
