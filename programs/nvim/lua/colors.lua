local colors = require('dracula').colors()

local highlight = function(group, fg, bg, attr, sp)
  fg = fg and "guifg=" .. fg or "guifg=NONE"
  bg = bg and "guibg=" .. bg or "guibg=NONE"
  attr = attr and "gui=" .. attr or "gui=NONE"
  sp = sp and "guisp=" .. sp or ""

  vim.api.nvim_command("highlight " .. group .. " " .. fg .. " " .. bg .. " " .. attr .. " " .. sp)
end

highlight("DiffAdd", nil, colors.selection, nil, nil)
highlight("DiffChange", nil, colors.selection, nil, nil)
highlight("DiffDelete", nil, colors.selection, nil, nil)
highlight("DiffText", nil, colors.selection, nil, nil)
