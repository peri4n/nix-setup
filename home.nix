{ config, pkgs, lib, ... }:

{
  imports = [
    ./programs/bat.nix
    ./programs/tmux.nix
    ./programs/git.nix
    ./programs/st/st.nix

    ./services/dunst.nix
    ./services/redshift.nix
  ];

  programs.home-manager.enable = true;

  home.username = "fbull";
  home.homeDirectory = "/home/fbull";

  home.packages = with pkgs; [
    bat
    dunst
    git
    gh
    haskell-language-server
    neovim
    rtorrent
    stack
    tmux
    tree
    youtube-dl
    zsh
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "21.11";
}
