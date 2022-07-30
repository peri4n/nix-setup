{ config, pkgs, lib, ... }:
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  imports = [
    ./programs/autorandr.nix
    ./programs/bat.nix
    ./programs/brave.nix
    ./programs/broot.nix
    ./programs/exa.nix
    ./programs/git/git.nix
    ./programs/gpg.nix
    ./programs/fzf.nix
    ./programs/dmenu/dmenu.nix
    ./programs/dircolors.nix
    ./programs/kitty/kitty.nix
    ./programs/lesspipe.nix
    ./programs/nvim/nvim.nix
    ./programs/readline.nix
    ./programs/starship.nix
    ./programs/xmobar.nix
    ./programs/zathura.nix
    ./programs/zsh/zsh.nix

    ./services/dunst.nix
    ./services/gpg-agent.nix
    ./services/picom.nix
    ./services/redshift.nix
  ];

  programs.home-manager.enable = true;

  home.username = "fbull";
  home.homeDirectory = "/home/fbull";

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    fira-code
    arandr
    anki
    autorandr
    aspell
    aspellDicts.de
    bat
    bitwarden-cli
    brave
    broot
    btop
    delta
    dunst
    calibre
    cabal-install
    entr
    exercism
    feh
    fd
    fzf
    git
    git-extras
    gitlint
    gh
    jdk
    jq
    jetbrains.idea-ultimate
    maim
    maven
    nodejs
    pavucontrol
    pinentry
    proselint
    qmk
    rtorrent
    ripgrep
    signal-desktop
    slack
    stack
    sqlite
    steam
    syncthing
    tealdeer
    tmux
    tree
    tree-sitter
    unzip
    minikube
    kubectl
    neovim-nightly
    xdotool
    xsel
    youtube-dl
    zathura
    zsh

    # Scala
    coursier

    # Python
    python39Packages.python-lsp-server

    # Go
    gopls

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

  home.sessionVariables = {
      EDITOR = "nvim";
      GPG_TTY = "$(tty)";
      JDTLS_HOME = "$HOME/downloads/jdtls/";

      # XDG
      XDG_DATA_DIRS = "$HOME/.nix-profile/share:$XDG_DATA_DIRS";

      # Courcier : Stack
      PATH = "$PATH:$HOME/.local/share/coursier/bin:$HOME/.local/bin";

      # Quickly switch vi modes
      KEYTIMEOUT=1;
  };

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
        "text/html" = [ "brave-browser.desktop" ];
        "x-scheme-handler/about" = [ "brave-browser.desktop" ];
        "x-scheme-handler/http" = [ "brave-browser.desktop" ];
        "x-scheme-handler/https" = [ "brave-browser.desktop" ];
        "x-scheme-handler/jetbrains" = [ "jetbrains-toolbox.desktop" ];
        "x-scheme-handler/unknown" = [ "brave-browser.desktop" ];
      };
    };
  };
}

