local awful = require('awful')
local wibox = require('wibox')

local vars = require('core.variables')

local volume_widget = wibox.widget.textbox()

local function set_widget_value()
    awful.spawn.with_line_callback(vars.volume_get_cmd, {
        stdout = function(line)
            volume_widget.text = line
        end,
    })
end

local function volumelower()
    awful.spawn.easy_async(vars.volume_lower_cmd, set_widget_value)
end

local function volumeraise()
    awful.spawn.easy_async(vars.volume_raise_cmd, set_widget_value)
end

local function volumetoggle()
    awful.spawn.easy_async(vars.volume_toggle_cmd, set_widget_value)
end

set_widget_value()

return {
    cmd = {
        lower = volumelower,
        raise = volumeraise,
        toggle = volumetoggle,
    },
    widget = volume_widget,
}