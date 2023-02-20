{ config, pkgs, lib, ... }:
{
  imports = [
    ./programs/autorandr.nix
    ./programs/bat.nix
    ./programs/brave.nix
    ./programs/broot.nix
    ./programs/direnv.nix
    ./programs/exa.nix
    ./programs/git/git.nix
    ./programs/gpg.nix
    ./programs/fzf.nix
    #./programs/dmenu/dmenu.nix
    ./programs/dircolors.nix
    ./programs/kitty/kitty.nix
    ./programs/lesspipe.nix
    ./programs/tealdeer.nix
    ./programs/nvim/nvim.nix
    ./programs/readline.nix
    #./programs/rofi/rofi.nix
    ./programs/starship.nix
    #./programs/xmobar.nix
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
    appimage-run
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    fira-code
#    anki
    aspell
    aspellDicts.de
    bat
    bitwarden-cli
    blueman
    blender
    brave
    broot
    btop
    delta
    difftastic
    dunst
    calibre
    cabal-install
    entr
    exercism
    feh
    fd
    foliate
    freecad
    fzf
    git
    git-extras
    gitlint
    gh
    gcc
    gof5
    heroku
    openjdk8
    jq
    jetbrains.idea-ultimate
    maim
    maven
    mongodb-tools
    nodejs
    obs-studio
    yarn
    pavucontrol
    pinentry
    postman
    psmisc
    proselint
    qmk
    rtorrent
    ripgrep
    signal-desktop
    slack
    stack
    sqlite
    steam
    spotify
    syncthing
    katagoWithCuda
    tealdeer
    tmux
    timewarrior
    taskwarrior
    tasksh
    unzip
    libreoffice
    minikube
    mplayer
    obsidian
    openscad
    kubectl
    vlc
    v4l-utils
    youtube-dl
    zsh
    zoom-us
    cura

    # Scala
    coursier

    # Python
    python39Packages.python-lsp-server

    # Go
    gopls

    # Haskell
    haskell-language-server
    cabal2nix

    # Nix
    rnix-lsp
    nixpkgs-fmt

    (jdt-language-server.overrideAttrs (old: rec { 
      version = "1.18.0";
      timestamp = "202212011657";
    }))

    # Lua
    sumneko-lua-language-server
    luaformatter

    # Typescript
    nodePackages.typescript-language-server

    # HTML JSON CSS ESLINT
    nodePackages.vscode-langservers-extracted
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "22.05";

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

      # Courcier : Stack
      PATH = "$PATH:$HOME/.local/share/coursier/bin:$HOME/.local/bin";

      # Quickly switch vi modes
      KEYTIMEOUT = 1;

      _JAVA_AWT_WM_NONREPARENTING = 1;
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

