-- Work with the vimrc
vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<cr>')

-- Center on the next match
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Make . work with visually selected lines
vim.keymap.set('v', '.', ':normal.<cr>')

-- Move visual selection
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Forget about the arrow keys
vim.keymap.set('n', '<down>', '<Nop>')
vim.keymap.set('n', '<up>', '<Nop>')
vim.keymap.set('n', '<left>', '<Nop>')
vim.keymap.set('n', '<right>', '<Nop>')

-- Easy tab switching
vim.keymap.set('n', '<S-h>', 'gT')
vim.keymap.set('n', '<S-l>', 'gt')

-- Git mappings
vim.keymap.set('n', '<leader>gg', ':Git<cr>')
vim.keymap.set('n', '<leader>gb', ':G blame<cr>')

-- Buffer mappings
vim.keymap.set('n', '<leader>x', ':only<cr>')
vim.keymap.set('n', '<leader>X', ':bdelete<cr>')

-- File explorer
vim.keymap.set('n', '<leader>T', ':NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>t', ':NvimTreeFindFileToggle<cr>')

-- Center after move
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader>zc', ':e Cards/')
