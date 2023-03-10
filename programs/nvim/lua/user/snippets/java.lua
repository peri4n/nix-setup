local ls = require('luasnip')

-- some shorthands...
local text = ls.text_node
local s = ls.snippet

return {
  s({
    trig = "foobar",
    name = "FooBar",
    dscr = "Yaml metadata format for markdown"
  }, { text("Faiersntioaresntoiarnt") })
}
