local common = require('user.lsp.common')

local capabilities = common.capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').yamlls.setup {
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = require('schemastore').yaml.schemas()
    },
  },
}
