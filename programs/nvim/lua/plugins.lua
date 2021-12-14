vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use 'dracula/vim'                  -- color theme

  use 'itchyny/lightline.vim'            -- Status line
  use 'airblade/vim-gitgutter'       -- Git gutter icons
  use 'justinmk/vim-dirvish'         -- File browser
  use 'tpope/vim-eunuch'             -- Utils for management

  use 'neovim/nvim-lspconfig'        -- Language Server Protocol
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'


  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'           -- Git support
  use 'tpope/vim-unimpaired'

  use 'junegunn/fzf.vim'             -- Fuzzy finder

  use {                              -- Haskell
      'neovimhaskell/haskell-vim'
  }

  use {                              -- Javascript
      'pangloss/vim-javascript'
  }

  use 'LnL7/vim-nix'                 -- Nix

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end)

