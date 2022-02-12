local ls = require('luasnip')

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true
})

require("luasnip.loaders.from_vscode").load()
