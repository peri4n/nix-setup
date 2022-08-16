{ pkgs, ... }:

with builtins;

{
  programs.rofi = {
    enable = true;
    theme = ./dracula.rasi;
  };
}
