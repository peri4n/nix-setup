vim.g['lightline'] = {
  colorscheme = 'dracula',
  active = {
    left = {
      { 'mode', 'paste' },
      { 'gitbranch', 'readonly', 'my_filename', 'modified' } },
    },
    right = {
      { 'lineinfo' },
      { 'percent' },
      { 'fileformat', 'fileencoding', 'filetype' }
    },
    component = {
      my_filename = '%f' -- This is needed so a dirvish has a filename although it's not a file
    },
    component_function = {
      gitbranch = 'FugitiveHead'
    },
  }
