{ pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$directory$character"
      ];
      scan_timeout = 10;
      character = {
        success_symbol = "[λ](green)";
        error_symbol = "[λ](red)";
        vicmd_symbol = "[λ](blue)";
      };
      directory = {
        style = "cyan";
      };
    };
  };
}
