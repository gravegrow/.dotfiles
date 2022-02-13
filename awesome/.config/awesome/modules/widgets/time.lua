local wibox = require("wibox")

local time = wibox.widget.textclock ('%H:%M')

local widget = wibox.widget (
    {
        forced_width = 65,
        layout = wibox.layout.align.horizontal,
        expand = "outside",
        nil,
        time,
        nil,
    }
)

time:connect_signal("button::press",
    function(_, _, _, button)
        -- if button == 1 then cw.toggle() end
    end)

return widget
