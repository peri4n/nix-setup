local null_ls = require("null-ls")
local cmd_resolver = require("null-ls.helpers.command_resolver")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "html", "json", "yaml" },
    }),
    null_ls.builtins.formatting.remark.with({
      dynamic_command = cmd_resolver.from_node_modules(),
    }),
    null_ls.builtins.diagnostics.gitlint,
    null_ls.builtins.diagnostics.proselint,
  },
})
