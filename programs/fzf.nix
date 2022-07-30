{ config, pkgs, lib, ... }:

let 
  colors = import ../themes/dracula.nix;
in {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = with colors.dracula.hex; [ 
      "--color=fg:${foreground},bg:${background},hl:${purple}"
      "--color=fg+:${foreground},bg+:${selection},hl+:${purple}"
      "--color=info:${orange},prompt:${green},pointer:${pink}"
      "--color=marker:${pink},spinner:${orange},header:${comment}" ];
    historyWidgetOptions = [ "--preview 'bat --style=numbers --color=always --line-range :500 {}'" ];
  };
}
