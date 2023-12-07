local theme_assets = require('beautiful.theme_assets')
local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi

local colorschemes = require('theme.colorschemes')
local vars = require('core.variables')

local assets_path = vars.theme.assets_dir

local theme = {}

theme.font = vars.theme.font

theme.bg_normal = colorschemes.gruvbox.bg0
theme.bg_focus = colorschemes.gruvbox.bg1
theme.bg_urgent = colorschemes.gruvbox.dark_red
theme.bg_minimize = colorschemes.gruvbox.bg2
theme.bg_systray = theme.bg_normal

theme.fg_normal = colorschemes.gruvbox.fg1
theme.fg_focus = colorschemes.gruvbox.fg0
theme.fg_urgent = colorschemes.gruvbox.fg0
theme.fg_minimize = colorschemes.gruvbox.fg0

theme.border_normal = colorschemes.gruvbox.gray
theme.border_focus = colorschemes.gruvbox.dark_gray
theme.border_marked = colorschemes.gruvbox.dark_red

theme.useless_gap = dpi(6)
theme.gap_single_client = true
theme.border_width = dpi(1)

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = assets_path .. 'submenu.png'
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = assets_path .. 'titlebar/close_normal.png'
theme.titlebar_close_button_focus = assets_path .. 'titlebar/close_focus.png'

theme.titlebar_minimize_button_normal = assets_path .. 'titlebar/minimize_normal.png'
theme.titlebar_minimize_button_focus = assets_path .. 'titlebar/minimize_focus.png'

theme.titlebar_ontop_button_normal_inactive = assets_path .. 'titlebar/ontop_normal_inactive.png'
theme.titlebar_ontop_button_focus_inactive = assets_path .. 'titlebar/ontop_focus_inactive.png'
theme.titlebar_ontop_button_normal_active = assets_path .. 'itlebar/ontop_normal_active.png'
theme.titlebar_ontop_button_focus_active = assets_path .. 'titlebar/ontop_focus_active.png'

theme.titlebar_sticky_button_normal_inactive = assets_path .. 'titlebar/sticky_normal_inactive.png'
theme.titlebar_sticky_button_focus_inactive = assets_path .. 'titlebar/sticky_focus_inactive.png'
theme.titlebar_sticky_button_normal_active = assets_path .. 'titlebar/sticky_normal_active.png'
theme.titlebar_sticky_button_focus_active = assets_path .. 'titlebar/sticky_focus_active.png'

theme.titlebar_floating_button_normal_inactive = assets_path .. 'titlebar/floating_normal_inactive.png'
theme.titlebar_floating_button_focus_inactive = assets_path .. 'titlebar/floating_focus_inactive.png'
theme.titlebar_floating_button_normal_active = assets_path .. 'titlebar/floating_normal_active.png'
theme.titlebar_floating_button_focus_active = assets_path .. 'titlebar/floating_focus_active.png'

theme.titlebar_maximized_button_normal_inactive = assets_path .. 'titlebar/maximized_normal_inactive.png'
theme.titlebar_maximized_button_focus_inactive = assets_path .. 'titlebar/maximized_focus_inactive.png'
theme.titlebar_maximized_button_normal_active = assets_path .. 'titlebar/maximized_normal_active.png'
theme.titlebar_maximized_button_focus_active = assets_path .. 'titlebar/maximized_focus_active.png'

theme.wallpaper = vars.theme.wallpapers_dir .. vars.theme.wallpaper

-- You can use your own layout icons like this:
theme.layout_fairh = assets_path .. 'layouts/fairhw.png'
theme.layout_fairv = assets_path .. 'layouts/fairvw.png'
theme.layout_floating = assets_path .. 'layouts/floatingw.png'
theme.layout_magnifier = assets_path .. 'layouts/magnifierw.png'
theme.layout_max = assets_path .. 'layouts/maxw.png'
theme.layout_fullscreen = assets_path .. 'layouts/fullscreenw.png'
theme.layout_tilebottom = assets_path .. 'layouts/tilebottomw.png'
theme.layout_tileleft = assets_path .. 'layouts/tileleftw.png'
theme.layout_tile = assets_path .. 'layouts/tilew.png'
theme.layout_tiletop = assets_path .. 'layouts/tiletopw.png'
theme.layout_spiral = assets_path .. 'layouts/spiralw.png'
theme.layout_dwindle = assets_path .. 'layouts/dwindlew.png'
theme.layout_cornernw = assets_path .. 'layouts/cornernww.png'
theme.layout_cornerne = assets_path .. 'layouts/cornernew.png'
theme.layout_cornersw = assets_path .. 'layouts/cornersww.png'
theme.layout_cornerse = assets_path .. 'layouts/cornersew.png'

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
