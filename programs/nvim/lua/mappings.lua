vim.api.nvim_set_keymap('n', '<leader><Space>', ':set hlsearch!<CR>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>ev', ':vsplit $MYVIMRC<cr>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<cr>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<down>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<up>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<left>', '<Nop>', {noremap = true, silent = true})
vim.api
    .nvim_set_keymap('n', '<right>', '<Nop>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>m', ':History<cr>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>gs', ':Gstatus<cr>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', ':Gcommit<cr>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<C-f>', ':FZF<cr>',
                        {noremap = true, silent = true})
vim.api
    .nvim_set_keymap('n', '<C-t>', ':Rg<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-e>', ':Buffers<cr>',
                        {noremap = true, silent = true})
