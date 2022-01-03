{ config, pkgs, lib, ... }:

{
  programs.zathura = {
    enable = true;
    extraConfig = ''
    set selection-clipboard clipboard
    '';
  };
}
