local ls = require('luasnip')

-- some shorthands...
local s = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node

local date = function()
  return os.date('%Y-%m-%d')
end

local page_heading = function()
  local file = vim.api.nvim_buf_get_name(0)
  return "# " .. file:match("^.+/(.+)%.md$")
end

return {
  s({
    trig = "meta",
    name = "Metadata",
    dscr = "Yaml metadata format for markdown"
  }, {
    text({ "---", "title: " }), insert(1, "note_title"),
    text({ "", "author: " }), insert(2, "author"),
    text({ "", "date: " }), func(date, {}),
    text({ "", "categories: [" }),
    insert(3, ""),
    text({ "]", "lastmod: " }),
    func(date, {}),
    text({ "", "tags: [" }),
    insert(4),
    text({ "]", "---", "" }),
    insert(0)
  }),
  s({
    trig = "title",
    name = "Page title",
    dscr = "Title of the page"
  }, {
    func(page_heading)
  })
}
