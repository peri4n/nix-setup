{ config, pkgs, libs, ... }:

{
  programs.neovim = {
    enable = true;
    extraConfig = ''
    luafile ~/.config/nvim/lua/plugins.lua
    luafile ~/.config/nvim/lua/settings.lua
    luafile ~/.config/nvim/lua/mappings.lua
    luafile ~/.config/nvim/lua/lsp.lua
    luafile ~/.config/nvim/lua/fzf.lua
    luafile ~/.config/nvim/lua/treesitter.lua
    '';
  };

  xdg.configFile."nvim/lua/plugins.lua".source = ./lua/plugins.lua;
  xdg.configFile."nvim/lua/settings.lua".source = ./lua/settings.lua;
  xdg.configFile."nvim/lua/mappings.lua".source = ./lua/mappings.lua;
  xdg.configFile."nvim/lua/lsp.lua".source = ./lua/lsp.lua;
  xdg.configFile."nvim/lua/treesitter.lua".source = ./lua/treesitter.lua;
  xdg.configFile."nvim/lua/fzf.lua".source = ./lua/fzf.lua;
}
