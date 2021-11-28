{ config, pkgs, lib, ... }:

{
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
