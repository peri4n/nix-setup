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
in
{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      luafile ~/.config/nvim/lua/settings.lua
      luafile ~/.config/nvim/lua/mappings.lua
      luafile ~/.config/nvim/lua/fzf.lua
      luafile ~/.config/nvim/lua/treesitter.lua
      luafile ~/.config/nvim/lua/cmp.lua
      luafile ~/.config/nvim/lua/lsp.lua
    '';
    plugins = with pkgs.vimPlugins; [
      dracula-theme
      fzf-vim
      (nvim-treesitter.withPlugins (p: pkgs.tree-sitter.allGrammars))
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp-buffer
      cmp-path
      cmp-cmdline

      lightline-vim
      haskell-vim

      vim-nix
      vim-gitgutter
      vim-dirvish
      vim-eunuch
      vim-javascript
      vim-fugitive
      vim-unimpaired
      vim-surround

    ];
  };

  xdg.configFile."nvim/lua/settings.lua".source = ./lua/settings.lua;
  xdg.configFile."nvim/lua/mappings.lua".source = ./lua/mappings.lua;
  xdg.configFile."nvim/lua/lsp.lua".source = ./lua/lsp.lua;
  xdg.configFile."nvim/lua/treesitter.lua".source = ./lua/treesitter.lua;
  xdg.configFile."nvim/lua/fzf.lua".source = ./lua/fzf.lua;
  xdg.configFile."nvim/lua/cmp.lua".source = ./lua/cmp.lua;
}
