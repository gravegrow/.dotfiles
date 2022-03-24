local awful = require('awful')
local wibox = require('wibox')

local kb_layout = wibox.widget
{
    { widget = awful.widget.keyboardlayout() },
    widget = wibox.container.margin,
}

local icon = wibox.widget
{
    {
        widget = wibox.widget.textbox('  '),
    },
    left = 0, right = -4, top = 0, bottom = -1,
    widget = wibox.container.margin,
}

local widget = wibox.widget
{
    icon,
    kb_layout,
    layout = wibox.layout.fixed.horizontal,
}

return widget
