{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;

    enableAutosuggestions = true;
    enableCompletion = false;
    defaultKeymap = "viins";

    history = {
      size = 10000000;
      save = 10000000;
      share = true;
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
      ignorePatterns = [ "rm *" "cp *" ];
    };

    initExtra = ''
      setopt PROMPT_SUBST              # Enable command substitution in the prompt
      setopt NULL_GLOB                 # If a glob does not match delete it as an argument
      setopt AUTO_PARAM_SLASH          # Tab completing directory appends a slash
      setopt NO_FLOW_CONTROL           # Disable start (C-s) and stop (C-q) characters
      setopt BANG_HIST                 # Treat the '!' character specially during expansion.
      setopt APPEND_HISTORY            # Append instead of replacing the history file
      setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
      setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
      setopt HIST_VERIFY               # Dont execute immediately upon history expansion.
      setopt VI                        # Enable vi mode
      setopt NO_BEEP                   # No beep!

      bindkey '^ ' autosuggest-accept
      bindkey '^[^M' autosuggest-execute # Ctrl-Enter

      # ================ Suffix aliases ===============

      alias -s nix=$EDITOR
      alias -s md=glow
      alias -s db=sqlite3

      # ================ Functions ====================
      mcd () {
          mkdir -p "$1" && cd "$1"
      }

      export BROWSER=firefox

      export MANPAGER="${pkgs.less}/bin/less -s -M +Gg"

      export LESS_TERMCAP_mb=$'\e[1;31m'      # begin bold
      export LESS_TERMCAP_md=$'\e[1;34m'      # begin blink
      export LESS_TERMCAP_so=$'\e[01;45;37m'  # begin reverse video
      export LESS_TERMCAP_us=$'\e[01;36m'     # begin underline
      export LESS_TERMCAP_me=$'\e[0m'         # reset bold/blink
      export LESS_TERMCAP_se=$'\e[0m'         # reset reverse video
      export LESS_TERMCAP_ue=$'\e[0m'         # reset underline

      export EXA_COLORS="uu=36:gu=37:sn=32:sb=32:da=34:ur=34:uw=35:ux=36:ue=36:gr=34:gw=35:gx=36:tr=34:tw=35:tx=36:"
    '';

    shellAliases = {
      # utility
      gw = "./gradlew";
      gwi = "./gradlew -i";
      g = "git";
      mkdir = "mkdir -pv";
      o = "xdg-open";
      e = "exit";

      # navigation
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";

      # ripgrep
      rga = "rg --hidden";

      # search
      ff = "find . -type f -name";

      # Task warrior
      tw = "task";
      twa = "task add";
      twl = "task list";
      twd = "task completed";

      # Docker
      d = "docker";
      dps = "docker ps";
      dc = "docker container";
      di = "docker images";

      # Docker Compose
      comp = "docker compose";
      compu = "docker compose up";
      comps = "docker compose stop";

      # exa
      l = "exa -l --git --group-directories-first";

      # systemd
      sc = "systemctl";
      scu = "systemctl --user";
      scus = "systemctl --user start";
      scur = "systemctl --user restart";
      scut = "systemctl --user stop";

      # tldr
      t = "tldr";
      tf = "tldr --list | fzf --preview \"tldr {1} --color=always\" --preview-window=right,60% | xargs tldr";

      # bat
      cat = "bat";
    };

    shellGlobalAliases = {
      L = "| less -R";
      G = "| grep";
      J = "| jq";
      NUL = "> /dev/null 2>&1";
    };

    dirHashes = {
      dl = "$HOME/downloads";
      nix = "$HOME/.config/nixpkgs";
      zk = "$HOME/docs/zk";
      jl = "$HOME/docs/journal";
      qmk = "$HOME/dev/repos/qmk_firmware";
    };
  };
}
