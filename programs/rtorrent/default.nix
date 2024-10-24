{ pkgs, ... }:
{
  programs.rtorrent = {
    enable = true;
    extraConfig = builtins.readFile ./rtorrent.rc;
  };
}
