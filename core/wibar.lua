local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')

local wibar = require('theme.wibar')
local wallpaper = require('theme.wallpaper')

local battery_cmd = require('core.variables').battery.widget_cmd

local function on_connect(s)
    -- Wallpaper
    wallpaper.set(s)

    -- Each screen has its own tag table.
    local names = { 'term', 'www', 'media', 'social', 'utils' }
    awful.tag(names, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function()
            awful.layout.inc(1)
        end),
        awful.button({}, 3, function()
            awful.layout.inc(-1)
        end),
        awful.button({}, 4, function()
            awful.layout.inc(1)
        end),
        awful.button({}, 5, function()
            awful.layout.inc(-1)
        end)
    ))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = wibar.buttons.taglist,
    })

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = wibar.buttons.tasklist,
    })

    -- Textclock widget with calendar popup
    local textclock = wibox.widget.textclock()
    local month_calendar = awful.widget.calendar_popup.month({
        opacity = 0.9,
        style_normal = {
            border_width = 0,
        },
        style_weekday = {
            border_width = 0,
        },
    })
    month_calendar:attach(textclock, 'tr', { on_hover = false })

    -- Create the wibox
    s.mywibox = awful.wibar({ position = 'top', screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup({
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            wibox.widget.textbox(' | '),
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.textbox(' | '),
            awful.widget.watch(battery_cmd, 60),
            wibox.widget.textbox(' | '),
            awful.widget.keyboardlayout(),
            wibox.widget.textbox(' | '),
            wibox.widget.systray(),
            wibox.widget.textbox(' | '),
            textclock,
            s.mylayoutbox,
        },
    })
end

return {
    on_connect = on_connect,
}
