{ pkgs, ... }:
{
  services.udiskie = {
    enable = true;
    settings = {
      automount = true;
    };
  };
}
