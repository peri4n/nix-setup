{ config, pkgs, lib, ... }:
{
  imports = [
    ./programs/bat.nix
    ./programs/bemenu
    ./programs/brave.nix
    ./programs/broot.nix
    ./programs/btop
    ./programs/direnv.nix
    ./programs/exa.nix
    ./programs/fzf.nix
    ./programs/git/git.nix
    ./programs/github
    ./programs/gpg.nix
    ./programs/kitty
    ./programs/lesspipe.nix
    ./programs/nvim/nvim.nix
    ./programs/readline.nix
    ./programs/starship.nix
    ./programs/sway
    ./programs/swaylock
    ./programs/tealdeer.nix
    ./programs/waybar
    ./programs/zathura.nix
    ./programs/zsh
    ./programs/zoxide

    ./services/blueman-applet
    ./services/clipman
    ./services/dunst.nix
    ./services/gammastep
    ./services/git-sync
    ./services/gpg-agent.nix
    ./services/kanshi
    ./services/nm-applet
    ./services/swayidle
    ./services/syncthing
  ];

  programs.home-manager.enable = true;

  home.username = "fbull";
  home.homeDirectory = "/home/fbull";


  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "Hasklig" ]; })
    anki
    appimage-run
    arduino-cli
    aspell
    aspellDicts.de
    awscli2
    bat
    bitwarden-cli
    blueman
    brave
    broot
    btop
    buku
    bukubrow
    calibre
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
    git-extras
    gitlint
    graphviz
    glab
    glow
    gopls
    hledger
    httpie
    jetbrains.idea-ultimate
    katago
    kubectl
    kubernetes-helm
    libreoffice
    marksman
    maven
    mplayer
    newsboat
    nap
    nixpkgs-fmt
    obsidian
    openscad
    pandoc
    pavucontrol
    pinentry
    proselint
    rnix-lsp
    rtorrent
    signal-desktop
    slack
    spotify
    steam
    tasksh
    taskwarrior
    tealdeer
    unzip
    v4l-utils
    vimgolf
    vlc
    zsh

    zk
    mustache-go
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.05";

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela";
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

    # Stack : Cargo
    PATH = "$PATH:$HOME/.local/bin:$HOME/.cargo/bin";

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
      };
    };

    configFile."swaycons/config.toml".source = ./programs/sway/swaycons.toml;
  };

}

