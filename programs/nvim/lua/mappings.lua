vim.api.nvim_set_keymap('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'n', 'nzz', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<down>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<up>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<left>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<right>', '<Nop>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>gg', ':Git<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', ':Gcommit<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<cr>', {noremap = true, silent = true})
