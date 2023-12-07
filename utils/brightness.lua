local awful = require('awful')

local vars = require('core.variables')

local function brightness_lower()
    awful.spawn.with_line_callback(vars.brightness.get_cmd, {
        stdout = function(line)
            local brightness = math.floor(tonumber(line) or vars.brightness.min_value)

            if brightness > vars.brightness.min_value then
                awful.spawn(vars.brightness.lower_cmd)
            end
        end,
    })
end

local function brightness_raise()
    awful.spawn.with_line_callback(vars.brightness.get_cmd, {
        stdout = function(line)
            local brightness = math.floor(tonumber(line) or vars.brightness.max_value)

            if brightness < vars.brightness.max_value then
                awful.spawn(vars.brightness.raise_cmd)
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
