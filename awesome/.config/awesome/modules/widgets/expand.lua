local wibox = require('wibox')
local beautiful = require('beautiful')

local empty_size = 3

local icon = wibox.widget
{
    {
        {
            widget = wibox.widget.textbox,
            text = "  ",
            font = beautiful.icon_font .. 14,
        },
        right = -empty_size,
        left = -5,
        widget = wibox.container.margin,
    },
    widget = wibox.container.background,
    bg = beautiful.border,
    forced_height = beautiful.bar_height - 2,
}

local text = wibox.widget
{
    widget = wibox.container.background,
    bg = beautiful.bg_focus,
    fg = beautiful.bg_normal,
    {
        {
            widget = wibox.widget.textbox,
            text = "TEXT",
        },
        right = 5,
        left = 2,
        widget = wibox.container.margin,
    },
}

local widget = wibox.widget
{
    {
        {widget = wibox.container.background},
        widget = wibox.container.background,
        bg = beautiful.bg_normal,
        forced_height = beautiful.useless_gap,
    },
    {
        icon,
        {
            {
                {widget = wibox.container.background},
                widget = wibox.container.background,
                bg = beautiful.bg_normal,
                forced_height = empty_size,
            },
            {
                {
                    {widget = wibox.container.background},
                    widget = wibox.container.background,
                    bg = beautiful.bg_focus,
                    forced_width = empty_size,
                },
                text,
                layout = wibox.layout.fixed.horizontal,
            },
            layout = wibox.layout.align.vertical,
        },
        layout = wibox.layout.fixed.horizontal,
    },
    {
        {
            {widget = wibox.container.background},
            widget = wibox.container.background,
            bg = beautiful.bg_normal,
            forced_width = empty_size,
        },
        {
            {widget = wibox.container.background},
            widget = wibox.container.background,
            bg = beautiful.bg_focus,
            forced_height = empty_size,
        },
        layout = wibox.layout.align.horizontal,
    },
    layout = wibox.layout.fixed.vertical,

}

return widget
