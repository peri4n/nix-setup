{ config, pkgs, lib, ... }:

{
  imports = [
    ./programs/bat.nix
    ./programs/tmux.nix
    ./programs/git.nix
    ./programs/st/st.nix
    ./programs/dmenu/dmenu.nix
    ./programs/xmobar.nix

    ./services/dunst.nix
    ./services/redshift.nix
  ];

  programs.home-manager.enable = true;

  home.username = "fbull";
  home.homeDirectory = "/home/fbull";

  home.packages = with pkgs; [
    bat
    delta
    dunst
    git
    gh
    neovim
    rtorrent
    stack
    tmux
    tree
    youtube-dl
    zsh

    # language servers
    rust-analyzer
    rnix-lsp
    haskell-language-server
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "21.11";

  services = {
    clipmenu = {
      enable = true;
    };
  };
}
