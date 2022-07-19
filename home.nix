{ config, pkgs, lib, ... }:
let
  my-xmonad = pkgs.callPackage ./programs/xmonad.nix { };
in
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
    # ./services/picom.nix
    ./services/redshift.nix
  ];

  programs.home-manager.enable = true;

  home.username = "fbull";
  home.homeDirectory = "/home/fbull";

  home.keyboard = {
    layout = "us";
    variant = "colemak";
    options = [ "ctrl:nocaps" "compose:ralt" ];
  };

  targets.genericLinux.enable = true;

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    fira-code
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
    entr
    exercism
    feh
    fzf
    git
    git-extras
    gitlint
    gh
    jq
    maim
    nodejs
    pinentry
    proselint
    qmk
    rtorrent
    ripgrep
    slack
    sqlite
    syncthing
    tealdeer
    tmux
    tree
    tree-sitter
    unzip
    my-xmonad
    neovim-nightly
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

  xsession = {
    enable = true;
    windowManager.command = "${my-xmonad}/bin/wm-exe";
  };

  home.file.".xinitrc".source = ./xinitrc;


}

