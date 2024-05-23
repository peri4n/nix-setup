require("user.lsp.none")
require("user.lsp.java")
require("user.lsp.rust")
require("user.lsp.lua")
require("user.lsp.jsonls")
require("user.lsp.yamlls")

local common = require('user.lsp.common')
local nvim_lsp = require('lspconfig')

local servers = { "hls", "nil_ls", "tsserver", "pylsp", "gopls", "cssls", "html", "tailwindcss" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = common.add_mappings,
    capabilities = common.capabilities
  }
end

local icons = require("user.icons")

local signs = {
  { name = "DiagnosticSignError", text = icons.diagnostics.Error },
  { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
  { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
  { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local conf = {
  -- disable virtual text
  virtual_text = false,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(conf)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

local dap, dapui = require("dap"), require("dapui")
dapui.setup();

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.lsp.inlay_hint.enable(true)
