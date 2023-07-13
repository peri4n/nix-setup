local dracula = require("dracula")
local colors = dracula.colors()

vim.api.nvim_set_hl(0, '@text.title.1', { fg = colors.cyan, bold = true })
vim.api.nvim_set_hl(0, '@text.title.2', { fg = colors.purple, bold = true })
vim.api.nvim_set_hl(0, '@text.title.3', { fg = colors.green, bold = true })
vim.api.nvim_set_hl(0, '@text.title.4', { fg = colors.yellow, bold = true })
