{ ... }:
let
  colors = import ../../themes/dracula.nix;
in
{
  programs.bemenu = {
    enable = true;
    settings = with colors.dracula.hex; {
      tb = comment;
      tf = foreground;
      fb = background;
      ff = foreground;
      nb = background;
      nf = comment;
      hb = currentLine;
      hf = green;
      sb = currentLine;
      sf = green;
      scb = background;
      scf = pink;
    };
  };
}
