local common = require('user.lsp.common')

local metals_config = require("metals").bare_config()
metals_config.on_attach = common.add_mappings
metals_config.capabilities = common.capabilities

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})

