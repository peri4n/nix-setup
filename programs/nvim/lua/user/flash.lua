local flash = require('flash')
flash.setup()

vim.keymap.set({'n', 'x', 'o'}, 's', function() flash.jump() end, {})
vim.keymap.set({'n', 'x', 'o'}, 'S', function() flash.treesitter() end, {})
vim.keymap.set({'o'}, 'r', function() flash.remote() end, {})
vim.keymap.set({'x', 'o'}, 'R', function() flash.treesitter_search() end, {})
