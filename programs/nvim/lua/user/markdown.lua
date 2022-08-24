vim.g['vim_markdown_folding_level'] = 2
vim.g['vim_markdown_frontmatter'] = 1
vim.g['vim_markdown_math'] = 1
vim.g['vim_markdown_no_extensions_in_markdown'] = 0 -- Do require .md extensions for Markdown links

vim.cmd([[
autocmd BufRead,BufNewFile   *.md set foldlevelstart=2
]])

