local offset_first_n = function(match, _, _, pred, metadata)
  ---@cast pred integer[]
  local capture_id = pred[2]
  if not metadata[capture_id] then metadata[capture_id] = {} end

  local range = metadata[capture_id].range or { match[capture_id]:range() }
  local offset = pred[3] or 0

  range[4] = range[2] + offset
  metadata[capture_id].range = range
end

vim.treesitter.query.add_directive("offset-first-n!", offset_first_n, true)

require 'nvim-treesitter.configs'.setup {
  ensure_installed = {},
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "+",
      node_incremental = "+",
      node_decremental = "-",
    },
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        ["ili"] = "@list_item.inner",
        ["ali"] = "@list_item.outer",
        ["icb"] = "@code_block.inner",
        ["acb"] = "@code_block.outer",
        ["ih"] = "@link.inner",
        ["ah"] = "@link.outer",
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]h"] = "@link.inner",
        ["]H"] = "@link.outer"
      }
    }
  }
}

require 'treesitter-context'.setup {
  enable = true,
  max_lines = 2,
  patterns = {
    default = {
      'class',
      'function',
      'method',
    },
    rust = {
      'impl_item',
    },
  },
}
