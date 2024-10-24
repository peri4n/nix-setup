{ pkgs, ... }:

let
  jdtlsWrapped = pkgs.writeShellScriptBin "jdtls" ''
    ${pkgs.jdt-language-server}/bin/jdtls --jvm-arg=-javaagent:${pkgs.lombok}/share/java/lombok.jar
  '';
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
      none-ls-nvim

      # telescope
      telescope-nvim
      telescope-project-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim

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
      SchemaStore-nvim

      # file browser
      oil-nvim

      nvim-web-devicons

      # gutter
      gitsigns-nvim

      # vcs
      diffview-nvim
      vim-fugitive

      # editing
      vim-unimpaired
      vim-surround
      flash-nvim
      nvim-autopairs
      rainbow-delimiters-nvim
      indent-blankline-nvim

      # snippets
      luasnip
      cmp_luasnip
      friendly-snippets

      # misc
      vim-ledger
      todo-comments-nvim
    ];

    extraPackages = with pkgs; [
      nodejs_22
      jdtlsWrapped
      checkstyle

      # Nix
      nil

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
  xdg.configFile."nvim/queries".source = ./queries;
  xdg.configFile."nvim/ftplugin".source = ./ftplugin;
}
