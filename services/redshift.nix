{ config, pkgs, lib, ... }:

{
  services.redshift = {
    enable = true;
    latitude = "51.496";
    longitude = "11.968";
  };
}
