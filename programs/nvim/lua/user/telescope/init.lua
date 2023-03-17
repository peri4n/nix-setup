local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    path_display = {
      shorten = {
        len = 3,
        exclude = {1, -1, -2}
      }
    },

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
vim.keymap.set('n', '<leader>ss', builtin.find_files)
vim.keymap.set('n', '<leader>sa', function() builtin.find_files({ no_ignore = true }) end)
vim.keymap.set('n', '<leader>sg', builtin.live_grep)
vim.keymap.set('n', '<leader>sd', builtin.diagnostics)
vim.keymap.set('n', '<leader>sc', builtin.git_commits)
vim.keymap.set('n', '<leader>sb', builtin.git_branches)
vim.keymap.set('n', '<leader>sq', builtin.quickfix)
vim.keymap.set('n', '<leader>sn', builtin.buffers)
vim.keymap.set('n', '<leader>st', builtin.treesitter)
vim.keymap.set('n', '<leader>sh', builtin.help_tags)
vim.keymap.set('n', '<leader>sc', require('user.telescope.picker').edit_configs)

telescope.load_extension("ui-select")
telescope.load_extension('fzf')

