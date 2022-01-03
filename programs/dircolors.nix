{ pkgs, ... }:

{
  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      ".sh" = "00;38;5;7";
    };
  };
}
