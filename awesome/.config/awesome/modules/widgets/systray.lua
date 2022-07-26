local wibox = require('wibox')
local beautiful = require('beautiful')
local markup = require('lain.util.markup')
local icon_exp, icon_col = '  ', '  '

local color = beautiful.fg_normal
local text = wibox.widget.textbox(markup.fg.color(color, icon_exp))

local hider = wibox.widget({
    {
        widget = text,
    },
    widget = wibox.container.margin,
    right = 1,
    left = -3,
    bottom = 3,
})

local function icon_swap()
    if text.text == icon_exp then
        text.markup = markup.fg.color(color, icon_col)
    else
        text.markup = markup.fg.color(color, icon_exp)
    end
end

local systray = wibox.widget({
    {
        widget = wibox.widget.systray,
    },
    visible = false,
    left = 8,
    right = 0,
    top = 5,
    bottom = 5,
    widget = wibox.container.margin,
})

local widget = wibox.widget({
    systray,
    hider,
    layout = wibox.layout.fixed.horizontal,
})

hider:connect_signal('button::press', function(_, _, _, button)
    if button == 1 then
        systray.visible = not systray.visible
        icon_swap()
    end
end)

return beautiful.widget_style(widget)
