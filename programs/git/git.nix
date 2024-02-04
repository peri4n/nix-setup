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
        ui = "auto";
      };
      commit = {
        gpgSign = false;
        template = "~/.gitmessage";
      };
      color."branch" = {
        current ="cyan bold reverse";
        local = "white";
        plain = "";
        remote = "cyan";
      };
      color."diff" = {
        commit = "";
        func = "cyan";
        plain = "";
        whitespace = "magenta reverse";
        meta = "white";
        frag = "cyan bold reverse";
        old = "red";
        new = "green";
      };
      color."grep" = {
        context = "";
        filename = "";
        function = "";
        linenumber = "white";
        match = "";
        selected = "";
        separator = "";
      };
      color."interactive" = {
        error = "";
        header = "";
        help = "";
        prompt = "white";
      };
      color."status" = {
        added = "green";
        changed = "yellow";
        header = "";
        localBranch = "";
        nobranch = "";
        remoteBranch = "cyan bold";
        unmerged = "magenta bold reverse";
        untracked = "red";
        updated = "green bold";
      };
      core = {
        editor = "nvim";
        autocrlf = "input";
        pager = "delta";
      };
      diff = {
        tool = "nvimdiff";
        colorMoved = "default";
      };
      delta = {
        dark = true;
        line-numbers = true;
        side-by-side = true;
        decorations = true;
        navigate = true;
        hyperlinks = true;
        syntax-theme = "Dracula";
      };
      init = {
        defaultBranch = "main";
      };
      merge = {
        renamelimit = 2000;
        conflictstyle = "diff3";
      };
      tag = {
        gpgSign = false;
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
      b = "branch --format='%(HEAD) %(color:cyan)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
      bd = "branch -d";
      c = "commit -v";
      ca = "commit -am";
      ce = "commit --amend";
      cen = "commit --amend --no-edit";
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
      ll = "log --graph --pretty=format:'%C(cyan)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      ls = "log --pretty=format:'%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]' --decorate --numstat";
      ph = "push";
      phf = "push -f";
      rb = "rebase";
      rbi = "rebase -i";
      rbc = "rebase --continue";
      rba = "rebase --abort";
      s = "status --short --branch";
      st = "stash";
      sts = "stash save";
      stl = "stash list";
      stp = "stash pop";
      rc = "! git rev-parse HEAD | tr -d '\n' | wl-copy";
    };
  };

  home.file.".gitmessage".source = ./gitmessage;
}
