local awful = require("awful")
local wibox = require("wibox")
local time = require("modules.widgets.time")
local beautiful = require("beautiful")
local gears = require("gears")
local xresources = require("beautiful.xresources")

local mykeyboardlayout = awful.widget.keyboardlayout()
mykeyboardlayout = wibox.container.margin(mykeyboardlayout, 0, 0, 0, 3)

local systray = wibox.widget.systray()
systray = wibox.container.margin(systray, 10, 5, 4, 4)
systray.visible = false

local buttons = gears.table.join(
                    awful.button({ }, 1, function(b) systray.visible = not systray.visible end)
                )

local hider = wibox.widget
{
    text = "  ",
    widget = wibox.widget.textbox,
    buttons = buttons,
}


local widget = wibox.widget
{
    layout = wibox.layout.fixed.horizontal,
    systray,
    hider,
    mykeyboardlayout,
    time,
}

return widget

