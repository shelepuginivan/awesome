-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, 'luarocks.loader')

-- Standard awesome library
local gears = require('gears')
local awful = require('awful')
require('awful.autofocus')
-- Widget and layout library
local wibox = require('wibox')
-- Theme handling library
local beautiful = require('beautiful')
-- Notification library
local menubar = require('menubar')
local hotkeys_popup = require('awful.hotkeys_popup')
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require('awful.hotkeys_popup.keys')

-- Menu
local menu = require('core.menu')

local wallpaper = require('theme.wallpaper')
local wibar = require('core.wibar')

-- Error handling
require('core.error_handling')

-- User variables
local vars = require('core.variables')

local config_dir = vars.config_dir
local terminal = vars.terminal
local editor = vars.editor
local editor_cmd = terminal .. ' -e ' .. editor
local modkey = vars.modkey

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(config_dir .. 'theme/theme.lua')

-- Layouts
awful.layout.layouts = require('core.layouts')
-- }}}

-- {{{ Menu
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = menu.main })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal('property::geometry', wallpaper.set)
awful.screen.connect_for_each_screen(wibar.on_connect)
-- }}}

-- {{{ Mouse bindings
root.buttons(require('bindings.mouse'))
-- }}}

-- Set keys
root.keys(require('bindings.globalkeys'))
-- }}}

-- {{{ Rules
awful.rules.rules = require('core.rules')
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal('manage', function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal('request::titlebars', function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({}, 1, function()
            c:emit_signal('request::activate', 'titlebar', { raise = true })
            awful.mouse.client.move(c)
        end),
        awful.button({}, 3, function()
            c:emit_signal('request::activate', 'titlebar', { raise = true })
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c):setup({
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal,
        },
        { -- Middle
            { -- Title
                align = 'center',
                widget = awful.titlebar.widget.titlewidget(c),
            },
            buttons = buttons,
            layout = wibox.layout.flex.horizontal,
        },
        { -- Right
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal(),
        },
        layout = wibox.layout.align.horizontal,
    })
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal('mouse::enter', function(c)
    c:emit_signal('request::activate', 'mouse_enter', { raise = false })
end)

client.connect_signal('focus', function(c)
    c.border_color = beautiful.border_focus
end)
client.connect_signal('unfocus', function(c)
    c.border_color = beautiful.border_normal
end)
-- }}}
