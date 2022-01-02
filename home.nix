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
    syncthing
    tmux
    tree
    tree-sitter
    unzip
    youtube-dl
    zathura
    zsh

    # Haskell
    haskell-language-server
    cabal2nix

    rust-analyzer
    rnix-lsp
    sumneko-lua-language-server
    nixpkgs-fmt
    luaformatter
    nodePackages.typescript-language-server
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "21.11";

  services = {
    clipmenu = {
      enable = true;
    };
    syncthing = {
      enable = true;
    };
  };

  fonts.fontconfig.enable = true;
}
