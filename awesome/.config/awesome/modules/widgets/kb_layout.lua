local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

local kb_layout = wibox.widget({
    { widget = awful.widget.keyboardlayout() },
    bottom = 5,
    widget = wibox.container.margin,
})

local icon = wibox.widget({
    {
        widget = wibox.widget.textbox('  '),
    },
    left = 0,
    right = -4,
    top = 0,
    bottom = 2,
    widget = wibox.container.margin,
})

local widget = wibox.widget({
    icon,
    kb_layout,
    layout = wibox.layout.fixed.horizontal,
})

return beautiful.widget_style(widget)
