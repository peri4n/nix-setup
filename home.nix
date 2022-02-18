{ config, pkgs, lib, ... }:
let
  my-xmonad = pkgs.callPackage ./programs/xmonad.nix { };
in
{
  imports = [
    ./programs/autorandr.nix
    ./programs/bat.nix
    ./programs/brave.nix
    ./programs/broot.nix
    ./programs/exa.nix
    ./programs/tmux.nix
    ./programs/git/git.nix
    ./programs/st/st.nix
    ./programs/fzf.nix
    ./programs/dmenu/dmenu.nix
    ./programs/dircolors.nix
    ./programs/lesspipe.nix
    ./programs/nvim/nvim.nix
    ./programs/nnn.nix
    ./programs/readline.nix
    ./programs/starship.nix
    ./programs/xmobar.nix
    ./programs/zathura.nix
    ./programs/zsh/zsh.nix

    ./services/dunst.nix
    ./services/picom.nix
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
    autorandr
    aspell
    aspellDicts.de
    bat
    brave
    broot
    btop
    delta
    dunst
    entr
    feh
    fzf
    git
    gh
    gnupg
    jq
    maim
    nodejs
    proselint
    qmk
    rtorrent
    ripgrep
    slack
    sqlite
    syncthing
    tmux
    tree
    tree-sitter
    unzip
    my-xmonad
    youtube-dl
    zathura
    zsh

    # Python
    python39Packages.python-lsp-server

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

