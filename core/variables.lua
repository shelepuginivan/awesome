local home = os.getenv('HOME')
local config_dir = home .. '/.config/awesome/'

return {
    general = {
        -- awesomewm configuration directory
        config_dir = config_dir,

        -- Default modkey.
        -- Usually, Mod4 is the key with a logo between Control and Alt.
        -- If you do not like this or do not have such a key,
        -- I suggest you to remap Mod4 to another key using xmodmap or other tools.
        -- However, you can use another modifier like Mod1, but it may interact with others.
        modkey = 'Mod4',

        -- The default editor to run
        editor = os.getenv('EDITOR') or 'nvim',

        -- The default terminal to run
        terminal = 'alacritty',
    },

    -- Theme variables
    theme = {
        assets_dir = config_dir .. 'assets/',
        font = 'JetBrainsMono Nerd Font Mono 8',

        -- Define the icon theme for application icons. If not set then the icons
        -- from /usr/share/icons and /usr/share/icons/hicolor will be used.
        icons = 'Papirus',
        wallpapers_dir = config_dir .. 'wallpapers/',
        wallpaper = 'awesome.png',
    },

    battery = {
        -- Battery widget command
        widget_cmd = 'bash -c "acpi -b | awk \'{gsub(/,/, \\"\\", $4); print \\"󱐋 \\" $4}\'"',
    },

    lockscreen = {
        cmd = 'betterlockscreen -l --show-layout',
    },

    volume = {
        -- Volume control
        lower_cmd = 'amixer -q -D pulse sset Master 5%-',
        raise_cmd = 'amixer -q -D pulse sset Master 5%+',
        toggle_cmd = 'amixer -D pulse set Master 1+ toggle',
        widget_cmd = 'bash -c "amixer -D pulse sget Master | egrep -o -m 1 \\"\\[[0-9]+%\\] \\[(on|off)\\]\\" | awk \'{gsub(/[][]/, \\"\\"); gsub(/on/, \\"󰕾\\"); gsub(/off/, \\"󰝟\\"); print \\$2 \\"  \\" \\$1}\'"',
    },
}
