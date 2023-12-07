-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, 'luarocks.loader')

local awful = require('awful')
require('awful.autofocus')
local beautiful = require('beautiful')
local menubar = require('menubar')

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require('awful.hotkeys_popup.keys')

local wallpaper = require('theme.wallpaper')
local wibar = require('core.wibar')

-- Error handling
require('core.error_handling')

-- User variables
local vars = require('core.variables')

local config_dir = vars.general.config_dir
local terminal = vars.general.terminal

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(config_dir .. 'theme/theme.lua')
-- Layouts
awful.layout.layouts = require('core.layouts')
-- }}}

-- {{{ Menu
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
require('core.signals')
-- }}}

-- XDG autostart implementation
awful.spawn.with_shell(config_dir .. '/autorun.sh')
