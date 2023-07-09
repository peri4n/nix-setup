{ config, pkgs, lib, ... }:
{
  imports = [
    ./programs/bat.nix
    ./programs/brave.nix
    ./programs/broot.nix
    ./programs/btop
    ./programs/direnv.nix
    ./programs/exa.nix
    ./programs/fzf.nix
    ./programs/git/git.nix
    ./programs/gpg.nix
    ./programs/kitty/kitty.nix
    ./programs/lesspipe.nix
    ./programs/nvim/nvim.nix
    ./programs/readline.nix
    ./programs/starship.nix
    ./programs/sway
    ./programs/swaylock
    ./programs/tealdeer.nix
    ./programs/waybar
    ./programs/zathura.nix
    ./programs/zsh/zsh.nix
    ./programs/zoxide

    ./services/blueman-applet
    ./services/clipman
    ./services/dunst.nix
    ./services/gammastep
    ./services/gpg-agent.nix
    ./services/nm-applet
    ./services/swayidle
    ./services/syncthing
  ];

  programs.home-manager.enable = true;

  home.username = "fbull";
  home.homeDirectory = "/home/fbull";


  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "Hasklig" ]; })
    appimage-run
    arduino
    aspell
    aspellDicts.de
    bat
    bemenu
    bitwarden-cli
    blueman
    brave
    broot
    btop
    buku
    cabal2nix
    calibre
    cura
    darktable
    delta
    difftastic
    dunst
    entr
    fd
    feh
    fira-code
    foliate
    freecad
    fzf
    gcc
    gh
    git
    git-extras
    gitlint
    glab
    glow
    gopls
    hledger
    httpie
    jq
    katago
    kubectl
    kubernetes-helm
    libreoffice
    marksman
    maven
    minikube
    mplayer
    nap
    nixpkgs-fmt
    openjdk11
    openscad
    pandoc
    pavucontrol
    pinentry
    postman
    proselint
    python39Packages.pygments
    python39Packages.python-lsp-server
    ripgrep
    rnix-lsp
    rtorrent
    signal-desktop
    slack
    spotify
    steam
    tasksh
    taskwarrior
    tealdeer
    texlive.combined.scheme-full
    timewarrior
    unzip
    v4l-utils
    vimgolf
    vlc
    zoom-us
    zsh

    (jdt-language-server.overrideAttrs (old: rec { 
      version = "1.20.0";
      timestamp = "202302201605";
    }))
    checkstyle

    # Lua
    sumneko-lua-language-server
    luaformatter

    # Typescript
    nodePackages.typescript-language-server

    # HTML JSON CSS ESLINT
    nodePackages.vscode-langservers-extracted
    nodePackages.vscode-json-languageserver
    nodePackages.yaml-language-server
    nodePackages."@tailwindcss/language-server"
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11";

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.gnome3.adwaita-icon-theme;
      name = "Adwaita";
    };
    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
  };

  # programs.direnv = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };
  #
  home.sessionVariables = {
      EDITOR = "nvim";
      GPG_TTY = "$(tty)";
      JDTLS_HOME = "$HOME/downloads/jdtls/";

      # XDG
      XDG_DATA_DIRS = "$HOME/.nix-profile/share:$XDG_DATA_DIRS";

      # Courcier : Stack : Cargo
      PATH = "$PATH:$HOME/.local/bin";

      # Quickly switch vi modes
      KEYTIMEOUT = 1;

      _JAVA_AWT_WM_NONREPARENTING = 1;
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

    configFile."swaycons/config.toml".source = ./programs/sway/swaycons.toml;
  };

}

