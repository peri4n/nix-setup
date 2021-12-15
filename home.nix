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
    nodejs
    rtorrent
    ripgrep
    rustup
    sqlite
    stack
    tmux
    tree
    tree-sitter
    unzip
    youtube-dl
    zathura
    zsh

    # language servers
    rust-analyzer
    rnix-lsp
    haskell-language-server
    sumneko-lua-language-server
    nixpkgs-fmt
    luaformatter
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "21.11";

  services = {
    clipmenu = {
      enable = true;
    };
  };
}
