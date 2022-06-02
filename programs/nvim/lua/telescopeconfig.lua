local M = {}

M.edit_configs = function()
  local opt = {
    cwd = '~/.config/nixpkgs',
    prompt_title = 'Edit configs',
  }
  require('telescope.builtin').find_files(opt)
end

return M
