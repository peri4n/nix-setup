{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "Fabian Bull";
    userEmail = "spam+github@fbull.de";
    extraConfig = {
      user = {
        signingkey = "5CFF22DEB3BEAFDD";
      };
      branch = {
        autosetuprebase = "always";
      };
      color = {
        ui = true;
      };
      commit = {
        gpgSign = false;
        template = "~/.gitmessage";
      };
      core = {
        editor = "nvim";
        autocrlf = "input";
        pager = "delta";
      };
      diff = {
        tool = "nvimdiff";
      };
      delta = {
        dark = true;
        line-numbers = true;
        side-by-side = true;
        syntax-theme = "Dracula";
      };
      init = {
        defaultBranch = "main";
      };
      merge = {
        renamelimit = 2000;
        ff = "no";
        conflictstyle = "diff3";
      };
      tag = {
        gpgSign = true;
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
      };
      pull = {
        rebase = true;
        ff = "only";
      };
      rerere = {
        enabled = true;
      };
    };
    aliases = {
      a = "add";
      aa = "add --all";
      b = "branch";
      c = "commit -v";
      ca = "commit --amend";
      can = "commit --amend --no-edit";
      cb = "checkout -b";
      co = "checkout";
      cm = "checkout master";
      cd = "checkout dev";
      cp = "cherry-pick";
      cpa = "cherry-pick --abort";
      cpc = "cherry-pick --continue";
      d = "diff";
      ds = "diff --staged";
      f = "fetch";
      pl = "pull --ff-only";
      plr = "pull --rebase";
      ll = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      ls = "log --pretty=format:'%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]' --decorate --numstat";
      ph = "push";
      phf = "push -f";
      s = "status --short --branch";
      st = "stash";
      stl = "stash list";
      stp = "stash pop";
      rc = "! git rev-parse HEAD | tr -d '\n' | xsel";
    };
  };

  home.file.".gitmessage".source = ./gitmessage;
}
