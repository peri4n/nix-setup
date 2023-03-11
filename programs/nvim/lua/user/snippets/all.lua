local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt

-- some shorthands...
local s = ls.snippet
local t = ls.text_node
local func = ls.function_node
local c = ls.choice_node

local date = function()
  return 'irsnt' .. os.date('%Y-%m-%d')
end

return {
  -- My signature
  s({
    trig = 'sign',
    name = 'Signature',
    dscr = 'My name'
  }, t('Fabian Bull')),

  -- The current date
  s({
    trig = 'date',
    name = 'Date',
    dscr = 'Date in the form of YYYY-MM-DD'
  }, func(date)),
  -- Comment
  s({
    trig = '//',
    name = 'Comment',
    dscr = 'Types of comments'
  }, fmt("// {}", c(1, { t("FIXME"), t("TODO") })
  )),
}
