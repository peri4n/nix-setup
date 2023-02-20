local common = require('user.lsp.common')

require('lspconfig').rust_analyzer.setup {
  on_attach = common.add_mappings,
  capabilities = common.capabilities,
}
