{ pkgs, ... }:
{
  programs.gh = {
    enable = true;
    enableGitCredentialHelper = true;
    extensions = [ pkgs.gh-dash ];
    settings = {
      git_protocol = "ssh";
      editor = "nvim";
    };
  };
}
