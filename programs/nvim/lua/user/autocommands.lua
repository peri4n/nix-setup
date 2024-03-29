-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

-- So that folding works for files opened with telescopes
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  command = "normal zx",
})

-- Set indentation for java files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "java" },
  callback = function()
    vim.cmd [[
      setlocal shiftwidth=4
      setlocal tabstop=4
    ]]
  end,
})

-- Dim inactive windows
vim.api.nvim_create_autocmd({ "FocusLost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "#2d2e39" })
  end
})

local colors = require('dracula').colors()
-- Dim inactive windows
vim.api.nvim_create_autocmd({ "FocusGained" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = colors.bg })
  end,
})
