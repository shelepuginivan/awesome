local home = os.getenv('HOME')
local config_dir = home .. '/.config/awesome/'

local screenshot_name = '%Y-%m-%d_%H-%M-%S.png'
local screenshots_path = home .. '/Images/Screenshots'

return {
    config_dir = config_dir,

    -- Default modkey.
    -- Usually, Mod4 is the key with a logo between Control and Alt.
    -- If you do not like this or do not have such a key,
    -- I suggest you to remap Mod4 to another key using xmodmap or other tools.
    -- However, you can use another modifier like Mod1, but it may interact with others.
    modkey = 'Mod4',

    -- This is used later as the default terminal and editor to run.
    editor = os.getenv('EDITOR') or 'nvim',
    terminal = 'alacritty',

    -- Theme
    assets_dir = config_dir .. 'assets/',
    font = 'JetBrainsMono Nerd Font Mono 8',
    wallpapers_dir = config_dir .. 'wallpapers/',
    wallpaper = 'awesome.png',

    -- Battery widget command
    battery_cmd = 'bash -c "acpi -b | awk \'{gsub(/,/, \\"\\", $4); print \\"󱐋 \\" $4}\'"',

    -- Screenshots
    screenshot_cmd = 'scrot ' .. screenshot_name .. " -e 'mv $f " .. screenshots_path .. "'",
    screenshot_focused_cmd = 'scrot -u ' .. screenshot_name .. " -e 'mv $f " .. screenshots_path .. "'",
    screenshot_select_cmd = 'scrot -s ' .. screenshot_name .. " -e 'mv $f " .. screenshots_path .. "'",

    -- Volume control
    volume_lower_cmd = 'amixer -q -D pulse sset Master 5%-',
    volume_raise_cmd = 'amixer -q -D pulse sset Master 5%+',
    volume_toggle_cmd = 'amixer -D pulse set Master 1+ toggle',
    volume_get_cmd = 'bash -c "amixer -D pulse sget Master | egrep -o -m 1 \\"\\[[0-9]+%\\] \\[(on|off)\\]\\" | awk \'{gsub(/[][]/, \\"\\"); gsub(/on/, \\"󰕾\\"); gsub(/off/, \\"󰝟\\"); print \\$2 \\"  \\" \\$1}\'"',

    -- Brightness control
    brightness_lower_cmd = 'xbacklight -dec 1',
    brightness_raise_cmd = 'xbacklight -inc 1',
    brightness_get_cmd = 'xbacklight -get',
    brightness_min = 1,
    brightness_max = 10,

    -- Screen lock
    screen_lock_cmd = 'betterlockscreen -l',
}
