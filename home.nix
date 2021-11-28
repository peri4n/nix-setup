{ config, pkgs, lib, ... }:

{
  imports = [
    ./programs/tmux.nix
    ./programs/git.nix

    ./services/dunst.nix
    ./services/redshift.nix
  ];

  programs.home-manager.enable = true;

  home.username = "fbull";
  home.homeDirectory = "/home/fbull";

  home.packages = [
    pkgs.dunst
    pkgs.git
    pkgs.gh
    pkgs.haskell-language-server
    pkgs.neovim
    pkgs.rtorrent
    pkgs.stack
    pkgs.tmux
    pkgs.tree
    pkgs.youtube-dl
    pkgs.zsh
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "21.11";
}
