-- Setup nvim-cmp.
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

require 'nvim-web-devicons'.setup {
  default = true
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

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
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    ['<C-k>'] = cmp.mapping(function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { 'i', 's' }),

    ['<C-j>'] = cmp.mapping(function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { 'i', 's' }),

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
