{ pkgs, ... }: {
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    settings = {
      git_protocol = "ssh";
      editor = "nvim";
    };
  };
}
