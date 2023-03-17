local common = require('user.lsp.common')

local capabilities = common.capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').jsonls.setup {
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}
