{ ... }: {
  programs.atuin = {
    enable = true;
    settings = {
      style = "compact";
      inline_height = 20;
      systemd_socket = true;
    };
  };
}
