local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local calendar = awful.widget.calendar_popup.month({ position = 'tr' })
local markup = require('lain.util.markup')

local _M = {}
function _M.setup(args)
    local icon = ' '
    local color = beautiful.blue
    local format = markup.fg.color(color, icon .. '%H:%M')
    local format_long = markup.fg.color(color, icon .. '%d %B | %A | %H:%M')
    local time = wibox.widget.textclock(format)

    local widget = wibox.widget({
        {
            layout = wibox.layout.fixed.horizontal,
            time,
        },
        right = 7,
        left = 7,
        bottom = 3,
        widget = wibox.container.margin,
    })

    local function toogle_time_format()
        if time.format ~= format then
            time.format = format
        else
            time.format = format_long
        end
    end

    widget:connect_signal('button::press', function(_, _, _, button)
        if button == 1 then
            toogle_time_format()
        end
        if button == 3 then
            calendar:toggle()
        end
    end)

    return beautiful.widget_style(widget)
end

return _M
