{ config, pkgs, lib, ... }:
{
  imports = [
    ./programs/bat.nix
    ./programs/brave.nix
    ./programs/broot.nix
    ./programs/dircolors.nix
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

    ./services/clipman
    ./services/dunst.nix
    ./services/gammastep
    ./services/gpg-agent.nix
    ./services/swayidle
    ./services/syncthing
  ];

  programs.home-manager.enable = true;

  home.username = "fbull";
  home.homeDirectory = "/home/fbull";


  home.packages = with pkgs; [
    appimage-run
    arduino
    (nerdfonts.override { fonts = [ "FiraCode" "Hasklig" ]; })
    fira-code
#    anki
    aspell
    aspellDicts.de
    bat
    bitwarden-cli
    blueman
    brave
    broot
    btop
    darktable
    delta
    difftastic
    dunst
    calibre
    entr
    feh
    fd
    foliate
    freecad
    fzf
    git
    git-extras
    gitlint
    gh
    glow
    gcc
    glab
    hledger
    httpie
    openjdk11
    jq
    maven
    nap
    pavucontrol
    pinentry
    postman
    proselint
    rtorrent
    ripgrep
    signal-desktop
    slack
    steam
    spotify
    katago
    tealdeer
    timewarrior
    taskwarrior
    tasksh
    unzip
    libreoffice
    texlive.combined.scheme-full

    minikube
    kubernetes-helm
    kubectl

    mplayer
    openscad
    pandoc
    vimgolf
    vlc
    v4l-utils
    zsh
    zoom-us
    cura

    # markdown
    marksman

    # Scala
    coursier

    # Python
    python39Packages.python-lsp-server
    python39Packages.pygments

    # Go
    gopls

    # Haskell
    haskell-language-server
    cabal2nix

    # Nix
    rnix-lsp
    nixpkgs-fmt

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

