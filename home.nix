{ config, pkgs, lib, ... }:
{
  imports = [
    ./programs/bat.nix
    ./programs/bemenu
    ./programs/brave.nix
    ./programs/broot
    ./programs/btop
    ./programs/direnv.nix
    ./programs/exa.nix
    ./programs/fzf.nix
    ./programs/git/git.nix
    ./programs/github
    ./programs/gpg.nix
    ./programs/jq
    ./programs/kitty
    ./programs/lesspipe.nix
    ./programs/nvim/nvim.nix
    ./programs/newsboat
    ./programs/ripgrep
    ./programs/readline.nix
    ./programs/starship.nix
    ./programs/sway
    ./programs/swaylock
    ./programs/tealdeer.nix
    ./programs/waybar
    ./programs/zathura
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
    ./services/wob
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
    bitwarden-cli
    blueman
    broot
    buku
    calibre
    darktable
    delta
    difftastic
    dunst
    entr
    fd
    feh
    foliate
    freecad
    fzf
    gcc
    gh
    git-extras
    gitlint
    glab
    glow
    gopls
    graphviz
    hledger
    httpie
    jetbrains.idea-ultimate
    katago
    kubectl
    kubernetes-helm
    libreoffice
    maven
    mplayer
    mustache-go
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
    unzip
    v4l-utils
    vimgolf
    vlc
    zk
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

