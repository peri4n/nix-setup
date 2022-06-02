require("null-ls").setup({
  sources = {
    require("null-ls").builtins.diagnostics.eslint.with({
      prefer_local = "node_modules/.bin",
    }),
  },
})
