local ls = require('luasnip')

ls.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
  store_selection_keys = '<c-s>'
})

vim.keymap.set({ "i", "s" }, "<a-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set({ "i", "s" }, "<a-h>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end)

require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/lua/user/snippets' })

