-- Setup nvim-cmp.
local cmp = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup({
   snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-e>'] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),
    ['<C-y>'] = cmp.mapping.confirm({select = true})
  },
  sources = cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'ultisnips'},
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
        ultisnips = '[snip]',
      }
    })
  },
  experimental = {
    native_menu = false;
    ghost_text_view = true;
  }
})
