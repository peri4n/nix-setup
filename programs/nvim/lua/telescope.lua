local telescope = require('telescope')
telescope.setup {
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",

    layout_strategy = "horizontal",

    selection_strategy = "reset",
    scroll_strategy = "cycle",
    color_devicons = true,
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
      theme = 'ivy',
      border = false,
    },
    live_grep = {
      theme = 'ivy',
      border = false,
    },
    quickfix = {
      theme = 'ivy',
      border = false,
    },
    buffers = {
      theme = 'ivy',
      border = false,
    },
    help_tags = {
      theme = 'ivy',
      border = false,
    },
    edit_configs = {
      theme = 'ivy',
      border = false,
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
  }
}
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fq', "<cmd>lua require('telescope.builtin').quickfix()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fc', "<cmd>lua require('telescopeconfig').edit_configs()<cr>", {noremap = true, silent = true})

telescope.load_extension('fzf')

