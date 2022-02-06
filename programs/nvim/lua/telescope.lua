local telescope = require('telescope')
telescope.setup {
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",

    layout_strategy = "horizontal",

    selection_strategy = "reset",
    scroll_strategy = "cycle",
    color_devicons = true
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
  }
}

vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({}))<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fq', "<cmd>lua require('telescope.builtin').quickfir(require('telescope.themes').get_ivy({}))<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({}))<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_ivy({}))<cr>", {noremap = true, silent = true})

telescope.load_extension('fzf')

