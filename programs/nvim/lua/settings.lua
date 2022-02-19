local set = vim.opt

--------------------------- Globals ---------------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.vimsyn_embed = 'l' -- Highlight Lua code in vim files

--------------------------- General ---------------------------
set.compatible = false
set.history = 1000 -- Store lots of :cmdline history
set.showcmd = true -- Show incomplete cmds down the bottom
set.visualbell = true -- No sounds
set.autoread = true -- Reread file content if file was changed outside of vim
set.cursorline = true -- Highlight current line
set.clipboard = 'unnamedplus' -- use only a single clipboard
set.tags = {'./tags', 'tags;'}
set.encoding = 'utf-8'
set.completeopt = "menu,menuone,noselect"
set.undofile = true

set.number = true -- Show line numbers
set.relativenumber = true -- Center line number around current line
set.hidden = true -- Switch buffers without saving them

--------------------------- Search ---------------------------
set.incsearch = true -- Find the next match as we type the search
set.hlsearch = true -- Highlight searches by default
set.smartcase = true -- Unless we type a capital

--------------------------- Color Scheme ---------------------
set.termguicolors = true
vim.cmd('colorscheme dracula')

--------------------------- Swap Files -----------------------
set.swapfile = false -- Do not create swap files
set.backup = false -- Do not leave backup files
set.writebackup = false -- Make backup before writing a file

--------------------------- Indentation ----------------------
set.expandtab = true -- Use spaces instead of tabs
set.tabstop = 2 -- Use 2 spaces
set.shiftwidth = 2 -- Use 2 spaces for indentation
set.softtabstop = 2 -- Just so that indenting behaves sane
set.smartindent = true -- Auto indenting when adding new line

--------------------------- Invisible Characters -------------
set.list = true -- toggle invisible characters
set.listchars = {
  tab = '» ',
  extends = '›',
  precedes = '‹',
  nbsp = '·',
  trail = '·',
  space = '·',
  eol = '¬'
}
set.showbreak = '↪' -- show at the beginning of a wrapped line

--------------------------- Wrapping -------------------------
set.wrap = false -- Don't wrap lines
set.linebreak = true -- Wrap lines at convenient points

--------------------------- Syntax ---------------------------
set.syntax = 'on' -- Enable syntax highlighting
set.showmatch = true -- Show matching braces

--------------------------- Splits ---------------------------
set.splitbelow = true
set.splitright = true

--------------------------- Spelling -------------------------
set.spell = false -- Turn on spelling
set.spelllang = 'en,de'
