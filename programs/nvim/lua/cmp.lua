-- Setup nvim-cmp.
local cmp = require 'cmp'
local luasnip = require("luasnip")
local lspkind = require 'lspkind'

cmp.setup({
   snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-e>'] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),

    ["<C-k>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),

    ["<C-j>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),

  },
  sources = cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip'},
    {name = 'buffer', keyword_length = 5},
    {name = 'path'}
  }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = true;
      menu = {
        buffer = '[buf]',
        nvim_lua = '[api]',
        nvim_lsp = '[LSP]',
        path = '[path]',
        luasnip = '[snip]',
      }
    })
  },
  experimental = {
    native_menu = false;
    ghost_text_view = true;
  }
})
