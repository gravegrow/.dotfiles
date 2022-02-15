local wibox = require("wibox")

local icon = wibox.widget
{
    {
        widget = wibox.widget.textbox('﨟 '),
    },
    bottom = -1,
    right = 2,
    widget = wibox.container.margin,
}

local time = wibox.widget.textclock ('%H:%M')
local widget = wibox.widget (
    {
        {
            layout = wibox.layout.fixed.horizontal,
            icon,
            time,
        },
        right = 7,
        left = 7,
        widget = wibox.container.margin,
    }
)

widget:connect_signal("button::press",
    function(_, _, _, button)
        -- if button == 1 then cw.toggle() end
    end)

return widget
