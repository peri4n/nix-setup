{ config, pkgs, ... }:

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
}
