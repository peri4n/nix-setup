{ config, pkgs, libs, ... }:

let
  dracula-theme = pkgs.vimUtils.buildVimPlugin {
    name = "dracula-theme-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "a219971291c56bcca3827cb7bd40aaaef23feeca";
      sha256 = "r1VhURChdutQFO9fiF+YV+MJycuj6xohTmR9DYpUFdk=";
    };
  };
  telescope-ui-select = pkgs.vimUtils.buildVimPlugin {
    name = "telescope-ui-select";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-ui-select.nvim";
      rev = "d02a3d3a6b3f6b933c43a28668ae18f78846d3aa";
      sha256 = "RKwoXrIWhW29kPEyQSGDg+0kcxCXPEl+U+DmuAgHhNM=";
    };
  };
  nvim-metals = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "nvim-metals";
    src = pkgs.fetchFromGitHub {
      owner = "scalameta";
      repo = "nvim-metals";
      rev = "3312490ef74ea149121a82fde578a13b1921cef9";
      sha256 = "TIqp1udXn5GW23jcprPk08nV85E3nYLXatOEEyUeIXY=";
    };
  };
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = ''
      lua require("user")
    '';

    plugins = with pkgs.vimPlugins; [
      dracula-theme
      (nvim-treesitter.withPlugins (p: [
        pkgs.tree-sitter-grammars.tree-sitter-css
        pkgs.tree-sitter-grammars.tree-sitter-go
        pkgs.tree-sitter-grammars.tree-sitter-haskell
        pkgs.tree-sitter-grammars.tree-sitter-html
        pkgs.tree-sitter-grammars.tree-sitter-java
        pkgs.tree-sitter-grammars.tree-sitter-javascript
        pkgs.tree-sitter-grammars.tree-sitter-json
        pkgs.tree-sitter-grammars.tree-sitter-latex
        pkgs.tree-sitter-grammars.tree-sitter-lua
        pkgs.tree-sitter-grammars.tree-sitter-markdown
        pkgs.tree-sitter-grammars.tree-sitter-python
        pkgs.tree-sitter-grammars.tree-sitter-query
        pkgs.tree-sitter-grammars.tree-sitter-rust
        pkgs.tree-sitter-grammars.tree-sitter-scala
        pkgs.tree-sitter-grammars.tree-sitter-tsx
        pkgs.tree-sitter-grammars.tree-sitter-typescript
        pkgs.tree-sitter-grammars.tree-sitter-nix
      ]))
      playground # treesitter playground
      nvim-treesitter-context
      nvim-lspconfig
      lualine-lsp-progress
      null-ls-nvim

      # telescope
      telescope-nvim
      telescope-fzf-native-nvim
      telescope-ui-select

      # cmp
      nvim-cmp
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp-buffer
      cmp-path
      cmp-cmdline
      lspkind-nvim

      lualine-nvim

      # languages
      haskell-vim
      vim-nix
      vim-javascript
      vim-markdown
      nvim-jdtls
      nvim-metals

      # file browser
      nvim-tree-lua

      nvim-web-devicons

      # gutter
      gitsigns-nvim

      # vcs
      diffview-nvim
      vim-fugitive

      # editing
      vim-unimpaired
      vim-surround
      lightspeed-nvim
      nvim-autopairs
      comment-nvim

      # snippets
      luasnip
      cmp_luasnip
      friendly-snippets

      vim-ledger
      impatient-nvim
      indent-blankline-nvim
    ];

    extraPython3Packages = (ps: with ps; [ python-lsp-server ]);
  };

  xdg.configFile."nvim/lua/user".source = ./lua/user;
}
