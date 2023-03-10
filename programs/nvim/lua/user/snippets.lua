local ls = require('luasnip')

-- some shorthands...
local s = ls.snippet
local text = ls.text_node
local func = ls.function_node

local date = function()
  return os.date('%Y-%m-%d')
end

ls.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
  store_selection_keys = '<c-s>'
})

ls.snippets = {
  all = {
    -- My signature
    s({
      trig = 'sign',
      name = 'Signature',
      dscr = 'My name'
    }, text('Fabian Bull')),

    -- The current date
    s({
      trig = 'date',
      name = 'Date',
      dscr = 'Date in the form of YYYY-MM-DD'
    }, func(date)),
  },
}

require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/lua/user/snippets' })
