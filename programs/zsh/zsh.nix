{ config, pkgs, ... }:

with builtins;

{
  programs.zsh = {
    enable = true;
    autocd = true;

    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;
    defaultKeymap = "viins";

    history = { 
      size = 10000000;
      save = 10000000;
      share = true;
      expireDuplicatesFirst = true;
      extended = true;
      ignorePatterns = ["rm *" "cp *"];
    };

    sessionVariables = { 
      EDITOR = "nvim";
      GPG_TTY = "$(tty)";
      NIX_PATH = "$NIX_PATH:$HOME/.nix-defexpr/channels";

      # FZF
      FZF_CTRL_T_OPTS = "--preview 'bat --style=numbers --color=always --line-range :500 {}'";
      FZF_DEFAULT_OPTS = "--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4";

      # NNN
      NNN_BMS = "n:~/docs/notes/;D:~/downloads/";
    };

    initExtraBeforeCompInit = ''
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
    '';
    
    initExtra = ''
      # Set normal mode timout to 0.1s
      export KEYTIMEOUT=1

      # ================ Prompt ====================
      function zle-line-init zle-keymap-select {
          PROMPT_NORMAL="%F{magenta}%(!.#.$) %f%F{cyan}%c%f "
          PROMPT_INS="%F{yellow}%(!.#.$) %f%F{cyan}%c%f "
          PROMPT="''${''${KEYMAP/vicmd/$PROMPT_NORMAL}/(main|viins)/$PROMPT_INS}$EPS1"
          zle reset-prompt
      }

      zle -N zle-line-init
      zle -N zle-keymap-select

      if [ -n "''${commands[fzf-share]}" ]; then
        source "$(fzf-share)/key-bindings.zsh"
        source "$(fzf-share)/completion.zsh"
      fi

      bindkey '^ ' autosuggest-accept
      bindkey '^[^M' autosuggest-execute # Ctrl-Enter

      # ================ Functions ====================
      mcd () {
          mkdir "$1" && cd "$1"
      }
    '';

    shellAliases = { 
      # utility
      v = "nvim";
      l = "ls -lh --color --group-directories-first";
      ll = "ls -Alh --color --group-directories-first";
      gw = "./gradlew";
      gwi = "./gradlew -i";
      g = "git";
      mkdir = "mkdir -pv";
      hm = "home-manager";
      sc = "systemctl";
      o = "xdg-open";
      e = "exit";

      # navigation
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";

      # search
      ff = "find . -type f -name";

      # Tmux
      tn = "tmux new-session";
      ta = "tmux attach";
      tl = "tmux list-sessions";
    };

    shellGlobalAliases  =  {
      L = "| less -R";
      G = "| grep";
    };

    dirHashes = { 
      dl = "$HOME/downloads";
      dap = "$HOME/work/repos/dap/master";
      eur = "$HOME/work/repos/europa";
    };

    plugins = [ 
        {
          name = "zsh-z";
          src = pkgs.fetchFromGitHub {
            owner = "agkozak";
            repo = "zsh-z";
            rev = "b5e61d03a42a84e9690de12915a006b6745c2a5f";
            sha256 = "1A6WZ+fJSf2WKZD7CYJB/pbgwV2mX+X8qInqQLeuT78=";
          };
        }
    ];
  };
}
