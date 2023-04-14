local dracula = require("dracula")
local colors = dracula.colors()

dracula.setup({
  show_end_of_buffer = false,
  italic_comment = true,
  overrides = {
    Comment = { fg = colors.bright_cyan, italic = true },
  }
})
