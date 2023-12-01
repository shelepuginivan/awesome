local home = os.getenv('HOME')
local config_dir = home .. '/.config/awesome/'

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

    -- Wallpapers
    wallpapers_dir = config_dir .. 'wallpapers/',
    wallpapers_file = 'awesome.png',
}
