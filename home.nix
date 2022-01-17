{ config, pkgs, lib, ... }:

{
  imports = [
    ./programs/autorandr.nix
    ./programs/bat.nix
    ./programs/tmux.nix
    ./programs/git.nix
    ./programs/st/st.nix
    ./programs/fzf.nix
    ./programs/dmenu/dmenu.nix
    ./programs/dircolors.nix
    ./programs/lesspipe.nix
    ./programs/nvim/nvim.nix
    ./programs/nnn.nix
    ./programs/readline.nix
    ./programs/xmobar.nix
    ./programs/zathura.nix
    ./programs/zsh/zsh.nix

    ./services/dunst.nix
    ./services/redshift.nix
  ];

  programs.home-manager.enable = true;

  home.username = "fbull";
  home.homeDirectory = "/home/fbull";

  targets.genericLinux.enable = true;

  home.packages = with pkgs; [
    autorandr
    aspell
    aspellDicts.de
    bat
    delta
    dunst
    entr
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

    # Rust
    rust-analyzer
    rustup

    # Nix
    rnix-lsp
    nixpkgs-fmt

    # Lua
    sumneko-lua-language-server
    luaformatter

    # Typescript
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

  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
          "application/pdf" = [ "org.pwmt.zathura.desktop" ];
          "x-scheme-handler/jetbrains" = [ "jetbrains-toolbox.desktop" ];
          "text/html" = [ "vivaldi-stable.desktop" ];
          "x-scheme-handler/http" = [ "vivaldi-stable.desktop" ];
          "x-scheme-handler/https" = [ "vivaldi-stable.desktop" ];
          "x-scheme-handler/about" = [ "vivaldi-stable.desktop" ];
          "x-scheme-handler/unknown" = [ "vivaldi-stable.desktop" ];
        };
    };
  };
}
