{ config, pkgs, ... }:
{
  services.git-sync = {
    enable = true;
    repositories = {
      challenges = {
        path =  config.home.homeDirectory + "/dev/challenges";
        uri = "git@github.com:peri4n/challenges.git";
      };
      journal = {
        path =  config.home.homeDirectory + "/journal";
        uri = "git@github.com:peri4n/journal.git";
      };
      zettelkasten = {
        path =  config.home.homeDirectory + "/zk";
        uri = "git@github.com:peri4n/zk.git";
      };
    };
  };
}
