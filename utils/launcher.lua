local awful = require('awful')

local vars = require('core.variables')

local function open_launcher()
    awful.spawn(vars.launcher.cmd)
end

return {
    cmd = open_launcher,
}
