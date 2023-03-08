local null_ls = require 'null-ls'

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint.with({
      prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.diagnostics.checkstyle.with({
            extra_args = { "-c", "check-style.xml" },
        }),
  },
})
