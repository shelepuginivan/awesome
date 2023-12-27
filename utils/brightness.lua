local awful = require('awful')

local vars = require('core.variables')

local function brightness_lower()
    awful.spawn(vars.brightness.lower_cmd)
end

local function brightness_raise()
    awful.spawn(vars.brightness.raise_cmd)
end

return {
    cmd = {
        lower = brightness_lower,
        raise = brightness_raise,
    },
}
