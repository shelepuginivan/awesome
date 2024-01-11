local awful = require('awful')
local hotkeys_popup = require('awful.hotkeys_popup')
local gears = require('gears')
local menubar = require('menubar')

local keys = require('bindings.keys')
local menu = require('core.menu')

local vars = require('core.variables')

local terminal = vars.general.terminal

local globalkeys = gears.table.join(
    awful.key({ keys.MODKEY }, 's', hotkeys_popup.show_help, { description = 'show help', group = 'awesome' }),
    awful.key({ keys.MODKEY }, 'Left', awful.tag.viewprev, { description = 'view previous', group = 'tag' }),
    awful.key({ keys.MODKEY }, 'Right', awful.tag.viewnext, { description = 'view next', group = 'tag' }),
    awful.key({ keys.MODKEY }, 'Escape', awful.tag.history.restore, { description = 'go back', group = 'tag' }),

    awful.key({ keys.MODKEY }, 'j', function()
        awful.client.focus.byidx(1)
    end, { description = 'focus next by index', group = 'client' }),
    awful.key({ keys.MODKEY }, 'k', function()
        awful.client.focus.byidx(-1)
    end, { description = 'focus previous by index', group = 'client' }),
    awful.key({ keys.MODKEY }, 'w', function()
        menu.main:show()
    end, { description = 'show main menu', group = 'awesome' }),

    -- Layout manipulation
    awful.key({ keys.MODKEY, keys.SHIFT }, 'j', function()
        awful.client.swap.byidx(1)
    end, { description = 'swap with next client by index', group = 'client' }),
    awful.key({ keys.MODKEY, keys.SHIFT }, 'k', function()
        awful.client.swap.byidx(-1)
    end, { description = 'swap with previous client by index', group = 'client' }),
    awful.key({ keys.MODKEY, keys.CTRL }, 'j', function()
        awful.screen.focus_relative(1)
    end, { description = 'focus the next screen', group = 'screen' }),
    awful.key({ keys.MODKEY, keys.CTRL }, 'k', function()
        awful.screen.focus_relative(-1)
    end, { description = 'focus the previous screen', group = 'screen' }),
    awful.key(
        { keys.MODKEY },
        'u',
        awful.client.urgent.jumpto,
        { description = 'jump to urgent client', group = 'client' }
    ),
    awful.key({ keys.MODKEY }, 'Tab', function()
        awful.client.focus.history.previous()
        if client.focus then
            client.focus:raise()
        end
    end, { description = 'go back', group = 'client' }),

    -- Standard program
    awful.key({ keys.MODKEY }, 'Return', function()
        awful.spawn(terminal)
    end, { description = 'open a terminal', group = 'launcher' }),
    awful.key({ keys.MODKEY, keys.CTRL }, 'r', awesome.restart, { description = 'reload awesome', group = 'awesome' }),
    awful.key({ keys.MODKEY, keys.SHIFT }, 'q', awesome.quit, { description = 'quit awesome', group = 'awesome' }),

    awful.key({ keys.MODKEY }, 'l', function()
        awful.tag.incmwfact(0.05)
    end, { description = 'increase master width factor', group = 'layout' }),
    awful.key({ keys.MODKEY }, 'h', function()
        awful.tag.incmwfact(-0.05)
    end, { description = 'decrease master width factor', group = 'layout' }),
    awful.key({ keys.MODKEY, keys.SHIFT }, 'h', function()
        awful.tag.incnmaster(1, nil, true)
    end, { description = 'increase the number of master clients', group = 'layout' }),
    awful.key({ keys.MODKEY, keys.SHIFT }, 'l', function()
        awful.tag.incnmaster(-1, nil, true)
    end, { description = 'decrease the number of master clients', group = 'layout' }),
    awful.key({ keys.MODKEY, keys.CTRL }, 'h', function()
        awful.tag.incncol(1, nil, true)
    end, { description = 'increase the number of columns', group = 'layout' }),
    awful.key({ keys.MODKEY, keys.CTRL }, 'l', function()
        awful.tag.incncol(-1, nil, true)
    end, { description = 'decrease the number of columns', group = 'layout' }),
    awful.key({ keys.MODKEY }, 'space', function()
        awful.layout.inc(1)
    end, { description = 'select next', group = 'layout' }),
    awful.key({ keys.MODKEY, keys.SHIFT }, 'space', function()
        awful.layout.inc(-1)
    end, { description = 'select previous', group = 'layout' }),

    awful.key({ keys.MODKEY, keys.CTRL }, 'n', function()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
            c:emit_signal('request::activate', 'key.unminimize', { raise = true })
        end
    end, { description = 'restore minimized', group = 'client' }),

    awful.key({ keys.MODKEY }, 'x', function()
        awful.prompt.run({
            prompt = 'Run Lua code: ',
            textbox = awful.screen.focused().mypromptbox.widget,
            exe_callback = awful.util.eval,
            history_path = awful.util.get_cache_dir() .. '/history_eval',
        })
    end, { description = 'lua execute prompt', group = 'awesome' }),

    -- Menubar
    awful.key({ keys.MODKEY }, 'p', function()
        menubar.show()
    end, { description = 'show the menubar', group = 'launcher' })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(
        globalkeys,
        -- View tag only.
        awful.key({ keys.MODKEY }, '#' .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                tag:view_only()
            end
        end, { description = 'view tag #' .. i, group = 'tag' }),
        -- Toggle tag display.
        awful.key({ keys.MODKEY, keys.CTRL }, '#' .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end, { description = 'toggle tag #' .. i, group = 'tag' }),
        -- Move client to tag.
        awful.key({ keys.MODKEY, keys.SHIFT }, '#' .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end, { description = 'move focused client to tag #' .. i, group = 'tag' }),
        -- Toggle tag on focused client.
        awful.key({ keys.MODKEY, keys.CTRL, keys.SHIFT }, '#' .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end, { description = 'toggle focused client on tag #' .. i, group = 'tag' })
    )
end

return globalkeys
