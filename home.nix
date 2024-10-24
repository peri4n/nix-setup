{ config, pkgs, ... }:

{
  imports = [
    ./programs/atuin
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
    ./programs/rtorrent
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
    ./services/gpg-agent.nix
    ./services/kanshi
    ./services/nm-applet
    ./services/swayidle
    ./services/syncthing
    ./services/udiskie
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
    rbw
    blueman
    broot
    buku
    calibre
    super-slicer-latest
    darktable
    delta
    difftastic
    dunst
    entr
    exercism
    fd
    feh
    foliate
    freecad
    fzf
    gcc
    gh
    git-extras
    git-town
    gitlint
    glab
    glow
    gnuplot
    gopls
    graphviz
    hledger
    hugo
    httpie
    jetbrains.idea-ultimate
    jdk21
    katago
    kubectl
    kubernetes-helm
    libreoffice
    libnotify
    man-pages
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
    pinentry-bemenu
    proselint
    signal-desktop
    slack
    spotify
    steam
    stylua
    spacenavd
    spnavcfg
    usql
    tailspin
    tasksh
    taskwarrior
    typst
    unzip
    unrar
    v4l-utils
    vimgolf
    vlc
    wine
    yad
    zeal
    zk
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.05";

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.dracula-icon-theme;
      name = "Dracula";
    };
    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
    gtk3 = {
      bookmarks =
        [ "file:///home/fbull/work/" "file:///home/fbull/docs/prints/" ];
    };
  };

  # programs.direnv = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };
  #
  home.sessionVariables = {
    EDITOR = "nvim";

    # Stack : Cargo
    PATH = "$PATH:$HOME/.local/bin:$HOME/.cargo/bin";

    # Quickly switch vi modes
    KEYTIMEOUT = 1;

    _JAVA_AWT_WM_NONREPARENTING = 1;
  };

  fonts.fontconfig.enable = true;

  xdg = {
    enable = true;
    userDirs = rec {
      enable = true;
      createDirectories = true;
      download = "${config.home.homeDirectory}/downloads";
      documents = "${config.home.homeDirectory}/docs";
      templates = "${documents}/templates";
      pictures = "${config.home.homeDirectory}/pics";
      music = "${config.home.homeDirectory}/music";
      videos = "${config.home.homeDirectory}/videos";
      publicShare = "${config.home.homeDirectory}/public";
    };

    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [ "org.pwmt.zathura.desktop" ];
        "application/epub+zip" = [ "com.github.johnfactotum.Foliate.desktop" ];
      };
    };

    configFile."swaycons/config.toml".source = ./programs/sway/swaycons.toml;
  };

}

