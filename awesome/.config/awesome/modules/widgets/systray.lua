local wibox = require('wibox')

local hider = wibox.widget
{
    {
        text = "  ",
        widget = wibox.widget.textbox,
    },
    left = 0, right = 3, top = 1, bottom = 1,
    widget = wibox.container.margin,
}

local systray = wibox.widget
{
    {
        widget = wibox.widget.systray,
    },
    visible = false,
    left = 8, right = 0, top = 5, bottom = 4,
    widget = wibox.container.margin,
}

local widget = wibox.widget
{
    systray,
    hider,
    layout = wibox.layout.fixed.horizontal
}

hider:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then systray.visible = not systray.visible end
    end)

return widget
