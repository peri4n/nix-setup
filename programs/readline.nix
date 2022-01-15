{ config, pkgs, lib, ... }:

{
  programs.readline = {
    enable = true;
    extraConfig = ''
      set editing-mode vi
      set keymap vi
      set bell-style none
      set show-all-if-unmodified On
    '';
  };
}
