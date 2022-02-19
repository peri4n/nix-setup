{ config, pkgs, libs, ... }:

let
  dracula-theme = pkgs.vimUtils.buildVimPlugin {
    name = "dracula-theme";
    src = pkgs.fetchFromGitHub {
      owner = "dracula";
      repo = "vim";
      rev = "74f63c304a0625c4ff9ce16784fce583b3a60661";
      sha256 = "Tmxb7xiDKz+swLV/B5a1/kGlOkdxKCo/XJBf4o8SsFg=";
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
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = ''
      luafile ~/.config/nvim/lua/settings.lua
      luafile ~/.config/nvim/lua/mappings.lua
      luafile ~/.config/nvim/lua/treesitter.lua
      luafile ~/.config/nvim/lua/cmp.lua
      luafile ~/.config/nvim/lua/lsp.lua
      luafile ~/.config/nvim/lua/lightline.lua
      luafile ~/.config/nvim/lua/markdown.lua
      luafile ~/.config/nvim/lua/telescope.lua
      luafile ~/.config/nvim/lua/git.lua
      luafile ~/.config/nvim/lua/gitsigns.lua
      luafile ~/.config/nvim/lua/snippets.lua
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
        pkgs.tree-sitter-grammars.tree-sitter-nix
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

      lightline-vim

      # languages
      haskell-vim
      vim-nix
      vim-javascript
      vim-markdown
      nvim-jdtls

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
  xdg.configFile."nvim/lua/lightline.lua".source = ./lua/lightline.lua;
  xdg.configFile."nvim/lua/markdown.lua".source = ./lua/markdown.lua;
  xdg.configFile."nvim/lua/telescope.lua".source = ./lua/telescope.lua;
  xdg.configFile."nvim/lua/telescopeconfig.lua".source = ./lua/telescopeconfig.lua;
  xdg.configFile."nvim/lua/git.lua".source = ./lua/git.lua;
  xdg.configFile."nvim/lua/gitsigns.lua".source = ./lua/gitsigns.lua;
  xdg.configFile."nvim/lua/snippets.lua".source = ./lua/snippets.lua;
}
