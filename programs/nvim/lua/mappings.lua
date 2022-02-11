vim.api.nvim_set_keymap('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'n', 'nzz', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {noremap = true, silent = true})

-- make . work with visually selected lines
vim.api.nvim_set_keymap('v', '.', ':normal.<cr>', {noremap = true, silent = true})

-- Move visual selection
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<down>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<up>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<left>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<right>', '<Nop>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>gg', ':Neogit<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', ':Gcommit<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gp', ':Neogit push<cr>', {noremap = true, silent = true})
