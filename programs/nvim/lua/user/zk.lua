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

-- Create a new note in the current directory with the current selection as content
vim.keymap.set("v",
  "<leader>zNc",
  ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>"
)

-- Create a new note in the current directory with the current selection as title
vim.keymap.set("v",
  "<leader>zNt",
  ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>"
)

-- List all notes
vim.keymap.set("n",
  "<leader>zl",
  ":ZkNotes<CR>"
)

-- List all notes in the current directory
vim.keymap.set("n",
  "<leader>zL",
  ":ZkNotes { hrefs = { vim.fn.expand('%:p:h') } }<CR>"
)

-- Insert link
vim.keymap.set("n",
  "<leader>zi",
  ":ZkInsertLink<CR>"
)
