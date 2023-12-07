local awful = require('awful')
local naughty = require('naughty')

local vars = require('core.variables')

local function notify(_, _, _, exit_code)
    if exit_code ~= 0 then
        return
    end

    naughty.notify({
        title = 'Screenshot',
        text = vars.screenshot.notify_text,
    })
end

local function screenshot()
    awful.spawn.easy_async(vars.screenshot.regular_cmd, notify)
end

local function screenshot_focused()
    awful.spawn.easy_async(vars.screenshot.focused_cmd, notify)
end

local function screenshot_select()
    awful.spawn.easy_async(vars.screenshot.select_cmd, notify)
end

return {
    cmd = {
        regular = screenshot,
        focused = screenshot_focused,
        select = screenshot_select,
    },
}
