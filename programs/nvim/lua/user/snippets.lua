local ls = require('luasnip')

-- some shorthands...
local s = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node

local date = function()
  return os.date('%Y-%m-%d')
 end

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    store_selection_keys = '<c-s>'
})

ls.snippets = {
  all = {
    -- My signature
    s({
      trig = "signature",
      name = "Signature",
      dscr = "My name"
    }, text("Fabian Bull")),

    -- The current date
    s({
      trig = "date",
      name = "Date",
      dscr = "Date in the form of YYYY-MM-DD"
    }, func(date)),
  },
  markdown = {
    s({
        trig = "meta",
        name = "Metadata",
        dscr = "Yaml metadata format for markdown"
    }, { text({"---",
        "title: "}), insert(1, "note_title"), text({"",
        "author: "}), insert(2, "author"), text({"",
        "date: "}), func(date, {}), text({"",
        "categories: ["}), insert(3, ""), text({"]",
        "lastmod: "}), func(date, {}), text({"",
        "tags: ["}), insert(4), text({"]",
        "---", ""}),
        insert(0)
      })
  }
}

require("luasnip.loaders.from_vscode").load()

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<cr>")
