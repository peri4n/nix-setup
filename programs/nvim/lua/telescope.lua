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
    ["ui-select"] = {
      require("telescope.themes").get_ivy()
    }
  }
}
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>fq', require('telescope.builtin').quickfix)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>fc', require('telescopeconfig').edit_configs)

telescope.load_extension("ui-select")
telescope.load_extension('fzf')

