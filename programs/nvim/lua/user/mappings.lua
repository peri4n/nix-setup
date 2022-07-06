local opts = { noremap = true, silent = true }

-- Work with the vimrc
vim.api.nvim_set_keymap('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<cr>', opts)

-- Center on the next match
vim.api.nvim_set_keymap('n', 'n', 'nzz', opts)
vim.api.nvim_set_keymap('n', 'N', 'Nzz', opts)

-- Make . work with visually selected lines
vim.api.nvim_set_keymap('v', '.', ':normal.<cr>', opts)

-- Move visual selection
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Forget about the arrow keys
vim.api.nvim_set_keymap('n', '<down>', '<Nop>', opts)
vim.api.nvim_set_keymap('n', '<up>', '<Nop>', opts)
vim.api.nvim_set_keymap('n', '<left>', '<Nop>', opts)
vim.api.nvim_set_keymap('n', '<right>', '<Nop>', opts)

-- Easy window switching
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)

-- Easy tab switching
vim.api.nvim_set_keymap('n', '<S-h>', 'gT', opts) vim.api.nvim_set_keymap('n',
'<S-l>', 'gt', opts)

-- Git mappings
vim.api.nvim_set_keymap('n', '<leader>gg', ':Git<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>gb', ':G blame<cr>', opts)

-- Buffer mappings
vim.api.nvim_set_keymap('n', '<leader>x', ':only<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>X', ':bdelete<cr>', opts)

-- File explorer
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<cr>', opts)
