local awful = require('awful')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup')

-- Load Debian menu entries
local debian = require('debian.menu')
local has_fdo, freedesktop = pcall(require, 'freedesktop')

local vars = require('core.variables')

local terminal = vars.general.terminal
local editor = vars.general.editor
local editor_cmd = terminal .. ' -e ' .. editor

-- Create a launcher widget and a main menu
local awesome_menu = {
    {
        'hotkeys',
        function()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end,
    },
    { 'manual', terminal .. ' -e man awesome' },
    { 'edit config', editor_cmd .. ' ' .. awesome.conffile },
    { 'restart', awesome.restart },
    {
        'quit',
        function()
            awesome.quit()
        end,
    },
}

local menu_awesome = { 'Awesome', awesome_menu, beautiful.awesome_icon }
local menu_terminal = { 'Open terminal', terminal }

local menu_main = awful.menu({
    items = {
        menu_awesome,
        { 'Debian', debian.menu.Debian_menu.Debian },
        menu_terminal,
    },
})

if has_fdo then
    menu_main = freedesktop.menu.build({
        before = { menu_awesome },
        after = { menu_terminal },
    })
end

return {
    awesome = menu_awesome,
    main = menu_main,
    terminal = menu_terminal,
}
