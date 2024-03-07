local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    path_display = {
      shorten = {
        len = 3,
        exclude = { -1, -2 }
      }
    },
    layout_strategy = "vertical",
    layout_config = {
        vertical = {
            width = 0.5,
            height = 0.7,
            preview_cutoff = 1,
            prompt_position = "top",
            preview_height = 0.4,
            mirror = true,
        },
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
    },
    project = {
      base_dirs = {
        -- work
        '~/work/repos/firmwareupdate-service',
        '~/work/repos/pg-cluster-config',
        '~/work/repos/qa-cluster-config',
        '~/work/repos/prod-cluster-config',

        -- private
        '~/dev/challenges/',

        -- docs
        '~/docs/blog/',
        '~/docs/zk/',

        -- setup
        '~/.config/nixpkgs/',
      },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "asc",
      search_by = "title",
      sync_with_nvim_tree = true, -- default false
    }
  }
}
vim.keymap.set('n', '<leader>ss', builtin.find_files)
vim.keymap.set('n', '<leader>sa', function() builtin.find_files({ no_ignore = true }) end)
vim.keymap.set('n', '<leader>sg', builtin.live_grep)
vim.keymap.set('n', '<leader>sd', builtin.diagnostics)
vim.keymap.set('n', '<leader>sc', builtin.git_commits)
vim.keymap.set('n', '<leader>sb', builtin.git_branches)
vim.keymap.set('n', '<leader>sr', builtin.resume)
vim.keymap.set('n', '<leader>sq', builtin.quickfix)
vim.keymap.set('n', '<leader>se', builtin.buffers)
vim.keymap.set('n', '<leader>st', builtin.treesitter)
vim.keymap.set('n', '<leader>sh', builtin.help_tags)
vim.keymap.set('n', '<leader>sc', require('user.telescope.picker').edit_configs)
vim.keymap.set('n', '<leader>sp', function() telescope.extensions.project.project({}) end)

telescope.load_extension('ui-select')
telescope.load_extension('fzf')
telescope.load_extension('project')
