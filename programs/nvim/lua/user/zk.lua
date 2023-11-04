--- Note Creation

-- Create a new note after asking for its title.
vim.keymap.set(
  "n",
  "<leader>zc",
  "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>"
)

-- Create a new note in the current directory after asking for its title.
vim.keymap.set(
  "n",
  "<leader>zC",
  "<Cmd>ZkNew { title = vim.fn.input('Title: '), dir = vim.fn.expand('%:p:h'),  }<CR>"
)

-- Create a new note in the current directory with the current selection as content
vim.keymap.set("v",
  "<leader>zCc",
  ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>"
)

-- Create a new note in the current directory with the current selection as title
vim.keymap.set("v",
  "<leader>zCt",
  ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>"
)

--- Content creation

-- Insert link
vim.keymap.set("n",
  "<leader>zi",
  ":ZkInsertLink<CR>"
)

--- Navigation

-- Backlinks
vim.keymap.set("n",
  "<leader>zb",
  ":ZkBacklinks<CR>"
)

-- Backlinks
vim.keymap.set("n",
  "<leader>zl",
  ":ZkLinks<CR>"
)

-- List all notes
vim.keymap.set("n",
  "<leader>zn",
  ":ZkNotes<CR>"
)

-- List all notes in the current directory
vim.keymap.set("n",
  "<leader>zN",
  ":ZkNotes { hrefs = { vim.fn.expand('%:p:h') } }<CR>"
)
