local config = {
  options = {
    icons_enabled = true,
    theme = 'dracula-nvim',
    globalstatus = true
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      {
        'filename',
        path = 4 -- relative paths
      }
    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_z = { 'location' }
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

ins_left {
  'lsp_progress',
  separators = {
    component = ' ',
    progress = ' | ',
    percentage = { pre = '', post = '%% ' },
    title = { pre = '', post = ': ' },
    lsp_client_name = { pre = '[', post = ']' },
    spinner = { pre = '', post = '' },
    message = { commenced = 'In Progress', completed = 'Completed' },
  },
  display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
  timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
  spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
}

require('lualine').setup(config)
