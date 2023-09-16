local opts = { noremap = true, silent = false }

-- Create a new note after asking for its title.
vim.keymap.set(
  "n",
  "<leader>zn",
  "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>"
)

-- Create a new note in the current directory after asking for its title.
vim.keymap.set(
  "n",
  "<leader>zN",
  "<Cmd>ZkNew { title = vim.fn.input('Title: '), dir = vim.fn.expand('%:p:h'),  }<CR>"
)

-- Create a new note in the current directory with the current selection
vim.keymap.set("v",
  "<leader>zNc",
  ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>"
)
