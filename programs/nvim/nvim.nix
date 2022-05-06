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
  lualine-global-status = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "lualine-global-status";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lualine";
      repo = "lualine.nvim";
      rev = "181b14348f513e6f9eb3bdd2252e13630094fdd3";
      sha256 = "qiKJNlVslVkx84202iOsNbhNNskK1h/wuCC1OiAv6Yg=";
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
      luafile ~/.config/nvim/lua/settings.lua
      luafile ~/.config/nvim/lua/treesitter.lua
      luafile ~/.config/nvim/lua/cmp.lua
      luafile ~/.config/nvim/lua/lsp.lua
      luafile ~/.config/nvim/lua/lualine.lua
      luafile ~/.config/nvim/lua/markdown.lua
      luafile ~/.config/nvim/lua/telescope.lua
      luafile ~/.config/nvim/lua/git.lua
      luafile ~/.config/nvim/lua/gitsigns.lua
      luafile ~/.config/nvim/lua/snippets.lua
      luafile ~/.config/nvim/lua/mappings.lua
      luafile ~/.config/nvim/lua/autopairs.lua
    '';
    plugins = with pkgs.vimPlugins; [
      dracula-theme
      (nvim-treesitter.withPlugins (p: [
        pkgs.tree-sitter-grammars.tree-sitter-javascript
        pkgs.tree-sitter-grammars.tree-sitter-typescript
        pkgs.tree-sitter-grammars.tree-sitter-haskell
        pkgs.tree-sitter-grammars.tree-sitter-java
        pkgs.tree-sitter-grammars.tree-sitter-python
        pkgs.tree-sitter-grammars.tree-sitter-rust
        pkgs.tree-sitter-grammars.tree-sitter-scala
        pkgs.tree-sitter-grammars.tree-sitter-lua
        # pkgs.tree-sitter-grammars.tree-sitter-nix
      ]))
      nvim-lspconfig

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

      lualine-global-status
      lualine-lsp-progress

      # languages
      haskell-vim
      vim-nix
      vim-javascript
      vim-markdown
      nvim-jdtls
      nvim-metals

      # file browser
      vim-dirvish
      vim-dirvish-git
      vim-eunuch

      nvim-web-devicons

      # gutter
      gitsigns-nvim

      # vcs
      neogit
      diffview-nvim

      # editing
      vim-unimpaired
      vim-surround
      lightspeed-nvim
      nvim-autopairs

      # snippets
      luasnip
      cmp_luasnip
      friendly-snippets
    ];

    extraPython3Packages = (ps: with ps; [ python-lsp-server ]);
  };

  xdg.configFile."nvim/lua/settings.lua".source = ./lua/settings.lua;
  xdg.configFile."nvim/lua/mappings.lua".source = ./lua/mappings.lua;
  xdg.configFile."nvim/lua/lsp.lua".source = ./lua/lsp.lua;
  xdg.configFile."nvim/lua/treesitter.lua".source = ./lua/treesitter.lua;
  xdg.configFile."nvim/lua/cmp.lua".source = ./lua/cmp.lua;
  xdg.configFile."nvim/lua/lualine.lua".source = ./lua/lualine.lua;
  xdg.configFile."nvim/lua/markdown.lua".source = ./lua/markdown.lua;
  xdg.configFile."nvim/lua/telescope.lua".source = ./lua/telescope.lua;
  xdg.configFile."nvim/lua/telescopeconfig.lua".source = ./lua/telescopeconfig.lua;
  xdg.configFile."nvim/lua/git.lua".source = ./lua/git.lua;
  xdg.configFile."nvim/lua/gitsigns.lua".source = ./lua/gitsigns.lua;
  xdg.configFile."nvim/lua/snippets.lua".source = ./lua/snippets.lua;
  xdg.configFile."nvim/lua/autopairs.lua".source = ./lua/autopairs.lua;
}
