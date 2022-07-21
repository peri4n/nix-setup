{ config, ... }:

{
  services = {
    picom = {
      enable = true;
      backend = "xrender";
      shadow = true;
      fade = true;
      fadeSteps = [ 0.06 0.06 ];
      vSync = true;
    };
  };
}
