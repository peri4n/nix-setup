local ls = require('luasnip')

-- some shorthands...
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local f = ls.function_node

return {
  s({
    trig = "auto",
    name = "Autowired",
    dscr = "Introduces an autowired variable"
  }, {
    t({ "@Autowired", "" }),
    c(1, {
      t("public "),
      t("private "),
      t("")
    }),
    i(0, "int foo")
  }),
  s("trig", c(1, {
    t("Ugh boring, a text node"),
    i(nil, "At least I can edit something now..."),
    f(function(args) return "Still only counts as text!!" end, {})
  }))

}
