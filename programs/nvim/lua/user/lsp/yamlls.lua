require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      schemas = require('schemastore').yaml.schemas()
    },
  },
}
