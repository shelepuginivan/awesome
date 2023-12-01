local awful = require('awful')
local gears = require('gears')

local menu = require('core.menu')

return gears.table.join(
    awful.button({}, 3, function()
        menu.main:toggle()
    end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
)
