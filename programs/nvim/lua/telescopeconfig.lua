local M = {}

M.edit_configs = function()
  local opt = require('telescope.themes').get_ivy {
    cwd = '~/.config/nixpkgs',
    prompt_title = 'Edit configs',
    shorten_path = true
  }
  require('telescope.builtin').find_files(opt)
end

return M
