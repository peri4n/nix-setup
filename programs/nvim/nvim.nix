{ config, pkgs, libs, ... }:

let
  nvim-wrapped = pkgs.writeShellScriptBin "v" ''
    export JAVA_OPTS=-javaagent:${pkgs.lombok}/share/java/lombok.jar
    nvim "$@"
  '';
  telescope-ui-select = pkgs.vimUtils.buildVimPlugin {
    name = "telescope-ui-select";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-ui-select.nvim";
      rev = "62ea5e58c7bbe191297b983a9e7e89420f581369";
      sha256 = "/JM2KX70JXa3sydrUj13Vd4rRwhn3VrdW7qLLHqIqyY=";
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
      dracula-nvim
      (nvim-treesitter.withAllGrammars)
      playground # treesitter playground
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-lspconfig
      nvim-dap
      nvim-dap-ui
      lualine-lsp-progress
      null-ls-nvim
      lsp-inlayhints-nvim

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
      cmp-git
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
      SchemaStore-nvim

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
      leap-nvim
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
  home.packages = [ nvim-wrapped ];

  xdg.configFile."nvim/lua/user".source = ./lua/user;
}
