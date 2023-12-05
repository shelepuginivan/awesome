local awful = require('awful')

local vars = require('core.variables')

local function screenshot()
    awful.spawn.with_shell(vars.screenshot_cmd)
end

local function screenshot_focused()
    awful.spawn.with_shell(vars.screenshot_focused_cmd)
end

local function screenshot_select()
    awful.spawn.with_shell(vars.screenshot_select_cmd)
end

return {
    cmd = {
        regular = screenshot,
        focused = screenshot_focused,
        select = screenshot_select,
    },
}
