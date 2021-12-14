{ config, pkgs, lib, ... }:

{
  imports = [
    ./programs/bat.nix
    ./programs/tmux.nix
    ./programs/git.nix
    ./programs/st/st.nix
    ./programs/dmenu/dmenu.nix
    ./programs/nvim/nvim.nix
    ./programs/xmobar.nix

    ./services/dunst.nix
    ./services/redshift.nix
  ];

  programs.home-manager.enable = true;

  home.username = "fbull";
  home.homeDirectory = "/home/fbull";

  home.packages = with pkgs; [
    aspell
    aspellDicts.de
    bat
    delta
    dunst
    feh
    fzf
    git
    gh
    gnupg
    htop
    jq
    maim
    rtorrent
    ripgrep
    rustup
    sqlite
    stack
    tmux
    tree
    unzip
    youtube-dl
    zathura
    zsh

    # language servers
    rust-analyzer
    rnix-lsp
    haskell-language-server
    sumneko-lua-language-server
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "21.11";

  services = {
    clipmenu = {
      enable = true;
    };
  };
}
