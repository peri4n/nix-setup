local telescope = require('telescope')
telescope.setup {
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    path_display = { "shorten" },

    layout_strategy = "horizontal",
    layout_config = {
      vertical = { width = 0.8 }
    },

    selection_strategy = "reset",
    scroll_strategy = "cycle",
    color_devicons = true,
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown()
    }
  }
}
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>fa', function() require('telescope.builtin').find_files({ no_ignore = true }) end)
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>fq', require('telescope.builtin').quickfix)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>fc', require('telescopeconfig').edit_configs)

telescope.load_extension("ui-select")
telescope.load_extension('fzf')

