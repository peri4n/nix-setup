{ config, pkgs, lib, ... }:

{
  services.redshift = {
    enable = false;
    latitude = "51.496";
    longitude = "11.968";
  };
}
