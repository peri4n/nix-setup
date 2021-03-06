{ config, pkgs, ... }:

with builtins;

{
  programs.zsh = {
    enable = true;
    autocd = true;

    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    defaultKeymap = "viins";

    history = { 
      size = 10000000;
      save = 10000000;
      share = true;
      expireDuplicatesFirst = true;
      extended = true;
      ignorePatterns = ["rm *" "cp *"];
    };

    initExtraBeforeCompInit = builtins.readFile ./dracula-syntax-highlighting.zsh;
    
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
      setopt EXTENDED_GLOB             # Enable extended globbing

      bindkey '^ ' autosuggest-accept
      bindkey '^[^M' autosuggest-execute # Ctrl-Enter

      # ================ Suffix aliases ===============

      alias -s nix=$EDITOR
      alias -s md=$EDITOR

      # ================ Functions ====================
      mcd () {
          mkdir -p "$1" && cd "$1"
      }

      # ================ Styles ====================
      zstyle ':completion:*' menu select
    '';

    shellAliases = { 
      # utility
      v = "nvim";
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

      # Tmux
      tn = "tmux new-session";
      ta = "tmux attach";
      tl = "tmux list-sessions";

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
      la = "exa -la --git --group-directories-first";

      # systemd
      sc = "systemctl";
      scu = "systemctl --user";
      scus = "systemctl --user start";
      scut = "systemctl --user stop";

      # Home manager
      hm = "home-manager";
      hms = "home-manager switch";
      hmo = "home-manager option";

      # bat
      cat = "bat";
    };

    shellGlobalAliases  =  {
      L = "| less -R";
      G = "| grep";
      J = "| jq";
      NUL = "> /dev/null 2>&1";
    };

    dirHashes = { 
      dl = "$HOME/downloads";
      dap = "$HOME/work/repos/dap/master";
      eur = "$HOME/work/repos/europa";
      nix = "$HOME/.config/nixpkgs";
      know = "$HOME/docs/knowledge";
      qmk = "$HOME/dev/repos/qmk_firmware";
      xmonad = "$HOME/dev/repos/XMonad";
    };

    plugins = [ 
        {
          name = "zsh-z";
          src = pkgs.fetchFromGitHub {
            owner = "agkozak";
            repo = "zsh-z";
            rev = "aaafebcd97424c570ee247e2aeb3da30444299cd";
            sha256 = "9Wr4uZLk2CvINJilg4o72x0NEAl043lP30D3YnHk+ZA=";
          };
        }
    ];
  };
}
