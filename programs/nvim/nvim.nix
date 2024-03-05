{ config, pkgs, libs, ... }:

let
  lombok = pkgs.lombok.overrideAttrs (oldAttrs: {
    version = "edge";
    src = pkgs.fetchurl {
      url = "https://projectlombok.org/lombok-edge.jar";
      sha256 = "dKGXarBfccfROP7oH/GiQ8kkVYcIrU9w5t7PHIFXYSQ=";
    };
  });
  jdtlsWrapped = pkgs.writeShellScriptBin "jdtls" ''
    ${pkgs.jdt-language-server}/bin/jdtls --jvm-arg=-javaagent:${lombok}/share/java/lombok.jar
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
  nvim-metals = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-metals";
    src = pkgs.fetchFromGitHub {
      owner = "scalameta";
      repo = "nvim-metals";
      rev = "3312490ef74ea149121a82fde578a13b1921cef9";
      sha256 = "TIqp1udXn5GW23jcprPk08nV85E3nYLXatOEEyUeIXY=";
    };
  };
  nvim-schemastore = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-schemastore";
    src = pkgs.fetchFromGitHub {
      owner = "b0o";
      repo = "SchemaStore.nvim";
      rev = "5e1225507dbc46710e7f2bec86f2444e578a959e";
      sha256 = "ZVCFe74vTQl7joDY1VmRCG3ot4CMH7w18cxQi5KvxMc=";
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
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-lspconfig
      nvim-dap
      nvim-dap-ui
      nvim-notify
      nvim-lsp-notify
      null-ls-nvim
      lsp-inlayhints-nvim

      # telescope
      telescope-nvim
      telescope-project-nvim
      telescope-fzf-native-nvim
      telescope-ui-select
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

      # copilot
      copilot-lua

      lualine-nvim

      # languages
      haskell-vim
      vim-nix
      vim-javascript
      vim-markdown
      zk-nvim
      nvim-jdtls
      nvim-metals
      nvim-schemastore

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
      indent-blankline-nvim
    ];

    extraPackages = with pkgs; [
      nodejs_21
      jdtlsWrapped
      checkstyle

      # Lua
      sumneko-lua-language-server
      luaformatter

      # Typescript
      nodePackages.typescript-language-server

      # HTML JSON CSS ESLINT
      nodePackages.vscode-langservers-extracted
      nodePackages.vscode-json-languageserver
      nodePackages.yaml-language-server
      nodePackages."@tailwindcss/language-server"
    ];

    extraPython3Packages = (ps: with ps; [ python-lsp-server ]);
  };

  xdg.configFile."nvim/lua/user".source = ./lua/user;
  xdg.configFile."nvim/ftplugin".source = ./ftplugin;
}
