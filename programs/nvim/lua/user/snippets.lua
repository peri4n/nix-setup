local ls = require('luasnip')

ls.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
  store_selection_keys = '<c-s>'
})

require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/lua/user/snippets' })
