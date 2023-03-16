-- Setup nvim-cmp.
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

require 'nvim-web-devicons'.setup {
  default = true
}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete({}),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<c-k>"] = cmp.mapping(function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { 'i', 's' }),

    ["<c-j>"] = cmp.mapping(function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { 'i', 's' }),
    ["<c-n>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<c-p>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<A-;>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item()
        cmp.mapping.confirm({ select = false })()
      end
    end, { "i", "s" }),

  },
  sources = {
    { name = "git" },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 5 },
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      menu = {
        buffer = '[BUF]',
        nvim_lua = '[API]',
        nvim_lsp = '[LSP]',
        path = '[PATH]',
        luasnip = '[SNIP]',
      }
    })
  },
  experimental = {
    native_menu = false;
    ghost_text_view = true;
  }
})

require("cmp_git").setup()

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})
