{ config, ... }:

{
  services = {
    picom = {
      enable = false;
      backend = "xrender";
      shadow = true;
      fade = true;
      vSync = true;
    };
  };
}
