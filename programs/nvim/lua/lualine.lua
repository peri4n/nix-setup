local colors = require('dracula').colors()

require('lualine').setup({
  options = {
    theme = 'dracula-nvim',
    globalstatus = true
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      {
        'filename',
        path = 1 -- relative paths
      },
      '%=',
      {
        'require("nvim-treesitter").statusline()',
        color = { fg = colors.orange }
      }
    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
})
