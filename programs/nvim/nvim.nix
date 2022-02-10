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
  cmp-nvim-ultisnips = (pkgs.vimUtils.buildVimPlugin {
    name = "cmp-nvim-ultisnips";
    src = pkgs.fetchFromGitHub {
      owner = "quangnguyen30192";
      repo = "cmp-nvim-ultisnips";
      rev = "79fd645096c406fb41b38ef4dd99525965b446b1";
      sha256 = "7Hu7H5Q7XgqgMFkFLRkwqDen6535h83KnsCHsfd1yas=";
    };
  }).overrideAttrs (oldAttrs: rec {
      buildInputs = [ pkgs.lua53Packages.luacheck ];
  });
in
{
  programs.neovim = {
    enable = true;
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

      # cmp
      nvim-cmp
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp-buffer
      cmp-path
      cmp-cmdline
      lspkind-nvim

      lightline-vim
      haskell-vim

      vim-dirvish
      vim-dirvish-git
      nvim-web-devicons
      vim-nix
      vim-gitgutter
      vim-eunuch
      vim-javascript
      vim-markdown
      neogit
      diffview-nvim
      vim-unimpaired
      vim-surround

      ultisnips
      cmp-nvim-ultisnips
      vim-snippets
    ];
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
}
