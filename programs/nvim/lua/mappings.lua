-- Work with the vimrc
vim.api.nvim_set_keymap('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<cr>', {noremap = true, silent = true})

-- Center on the next match
vim.api.nvim_set_keymap('n', 'n', 'nzz', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {noremap = true, silent = true})

-- Make . work with visually selected lines
vim.api.nvim_set_keymap('v', '.', ':normal.<cr>', {noremap = true, silent = true})

-- Move visual selection
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true, silent = true})

-- Forget about the arrow keys
vim.api.nvim_set_keymap('n', '<down>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<up>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<left>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<right>', '<Nop>', {noremap = true, silent = true})

-- Easy window switching
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

-- Git mappings
vim.api.nvim_set_keymap('n', '<leader>gg', ':Git<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', ':G blame<cr>', {noremap = true, silent = true})

-- Buffer mappings
vim.api.nvim_set_keymap('n', '<leader>x', ':only<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>X', ':bdelete<cr>', {noremap = true, silent = true})
