local dracula = require("dracula")

dracula.setup({
  show_end_of_buffer = false,
  italic_comment = true,
  overrides = function(colors)
    return {
      Comment = { fg = colors.bright_cyan, italic = true },
      ["@markup.heading.1"] = { fg = colors.pink, bold = true, italic = true },
      ["@markup.heading.2"] = { fg = colors.orange, bold = true, italic = true },
      ["@markup.heading.3"] = { fg = colors.yellow, bold = true, italic = true },
      ["@markup.heading.4"] = { fg = colors.green, bold = true, italic = true },
      ["@markup.heading.5"] = { fg = colors.cyan, bold = true, italic = true },
      ["@markup.todo.checked.conceal"] = { fg = colors.green },
      ["@markup.todo.unchecked.conceal"] = { fg = colors.bright_blue }
    }
  end,
})

require("rainbow-delimiters.setup").setup({})
