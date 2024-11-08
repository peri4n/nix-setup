{ pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [ "$directory$git_branch$character" ];
      scan_timeout = 10;
      character = {
        success_symbol = "[λ](green)";
        error_symbol = "[✖](blue)";
        vicmd_symbol = "[λ](blue)";
      };
      directory = {
        style = "cyan";
        truncation_length = 2;
      };
      git_branch = {
        symbol = "";
        format = "[$branch]($style) ";
        style = "blue";
      };
    };
  };
}
