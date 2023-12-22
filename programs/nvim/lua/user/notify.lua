require("notify").setup {
  top_down = false,
}

require('lsp-notify').setup({
  notify = require("notify"),
})
