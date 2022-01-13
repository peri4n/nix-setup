{ config, pkgs, ... }:

{
  programs.nnn = {
    enable = true;
    bookmarks = {
      D = "~/downloads";
    };
  };
}
