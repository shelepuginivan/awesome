local awful = require('awful')

local vars = require('core.variables')

local function brightness_lower()
    awful.spawn.with_line_callback(vars.brightness_get_cmd, {
        stdout = function(line)
            local brightness = math.floor(tonumber(line) or vars.brightness_min)

            if brightness > vars.brightness_min then
                awful.spawn(vars.brightness_lower_cmd)
            end
        end,
    })
end

local function brightness_raise()
    awful.spawn.with_line_callback(vars.brightness_get_cmd, {
        stdout = function(line)
            local brightness = math.floor(tonumber(line) or vars.brightness_max)

            if brightness < vars.brightness_max then
                awful.spawn(vars.brightness_raise_cmd)
            end
        end,
    })
end

return {
    cmd = {
        lower = brightness_lower,
        raise = brightness_raise,
    },
}
