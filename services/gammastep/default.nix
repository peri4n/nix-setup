{ config, pkgs, lib, ... }:
{
  services.gammastep = {
    enable = true;
    latitude = 51.5;
    longitude = 12.0;
    provider = "manual";
    tray = true;
    temperature = {
      day = 5700;
      night = 3500;
    };
  };
}
