local awful = require('awful')

local vars = require('core.variables')

local function lock_screen()
    awful.spawn(vars.lockscreen.cmd)
end

return {
    cmd = lock_screen,
}
