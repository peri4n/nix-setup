require "nvim-tree".setup {
  actions = {
    open_file = {
      resize_window = true
    }
  },
  renderer = {
    group_empty = true,
  },
  git = {
    enable = true
  }
}
