{ config, pkgs, lib, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "fbull";
  home.homeDirectory = "/home/fbull";

  home.packages = [
    pkgs.dunst
    pkgs.git
    pkgs.gh
    pkgs.haskell-language-server
    pkgs.neovim
    pkgs.rtorrent
    pkgs.stack
    pkgs.tmux
    pkgs.tree
    pkgs.youtube-dl
    pkgs.zsh
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "21.11";

  programs.git = {
    enable = true;
    userName = "Fabian Bull";
    userEmail = "fabian@fbull.de";
    extraConfig = {
      branch = {
        autosetuprebase = "always";
      };
      color = {
        ui = true;
      };
      core = {
        editor = "nvim";
        autocrlf = "input";
      };
      init = {
        defaultBranch = "main";
      };
      merge = {
        renamelimit = 2000;
      };
      push = {
        default = "simple";
      };
      pull = {
        rebase = true;
      };
      rerere = {
        enabled = true;
      };
    };
  };

  programs.tmux = {
    enable = true;
    shortcut = "a";
    keyMode = "vi";
    terminal = "tmux-256color";
    escapeTime = 0;
    historyLimit = 3000;
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = lib.strings.fileContents ./tmux.conf;
    plugins = with pkgs.tmuxPlugins; [
      open
      yank
      {
        plugin = copycat;
        extraConfig = "set -g @copycat_search_m '\b[0-9a-f]{5,40}\b'";
      }
      {
        plugin = dracula;
        extraConfig = ''
          set -g @dracula-show-left-icon session
          set -g @dracula-plugins "time"
        '';
      }
    ];
  };
}
