{ pkgs, ... }: {
  programs.jq = {
    enable = true;
    colors = {
      null = "1;30";
      true = "0;31";
      false = "0;32";
      numbers = "0;35";
      strings = "0;39";
      arrays = "1;35";
      objects = "1;35";
    };
  };
}
