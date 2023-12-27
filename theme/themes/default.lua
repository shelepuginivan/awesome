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

return {
    bg_normal = '#222222',
    bg_focus = '#535d6c',
    bg_urgent = '#ff0000',
    bg_minimize = '#444444',
    bg_systray = '#222222',

    fg_normal = '#aaaaaa',
    fg_focus = '#ffffff',
    fg_urgent = '#ffffff',
    fg_minimize = '#ffffff',

    border_normal = '#535d6c',
    border_focus = '#444444',
    border_marked = '#91231c',

    font = 'sans 8',

    -- Define the icon theme for application icons. If not set then the icons
    -- from /usr/share/icons and /usr/share/icons/hicolor will be used.
    icon_theme = nil,

    -- Put wallpapers in wallpapers_dir specified in core/variables.lua.
    -- Use relative path to that directory.
    wallpaper = 'awesome.png',
}
