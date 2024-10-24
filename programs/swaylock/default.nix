{ pkgs, ... }:

let colors = import ../../themes/dracula.nix;
in {
  programs.swaylock = {
    enable = true;
    settings = with colors.dracula.hex; {
      image = "${./lake-wallpaper.jpg}";
      font = "FiraCode Nerd Font";
      color = background;
      inside-color = dark_gray;
      line-color = dark_gray;
      ring-color = purple;
      text-color = foreground;

      layout-bg-color = dark_gray;
      layout-text-color = foreground;

      inside-clear-color = comment;
      line-clear-color = dark_gray;
      ring-clear-color = comment;
      text-clear-color = dark_gray;

      inside-ver-color = purple;
      line-ver-color = dark_gray;
      ring-ver-color = purple;
      text-ver-color = dark_gray;

      inside-wrong-color = red;
      line-wrong-color = dark_gray;
      ring-wrong-color = red;
      text-wrong-color = dark_gray;

      bs-hl-color = red;
      key-hl-color = green;

      text-caps-lock-color = foreground;
    };
  };
}
