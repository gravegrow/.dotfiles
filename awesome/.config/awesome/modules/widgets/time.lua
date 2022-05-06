local wibox = require("wibox")
local awful = require("awful")

local calendar = awful.widget.calendar_popup.month({ position = "tr" })

local icon = wibox.widget({
	{
		widget = wibox.widget.textbox(" "),
	},
	bottom = -1,
	right = 2,
	widget = wibox.container.margin,
})

local format = "%H:%M"
local format_long = "%d %B | %A | %H:%M"
local time = wibox.widget.textclock(format)

local widget = wibox.widget({
	{
		layout = wibox.layout.fixed.horizontal,
		icon,
		time,
	},
	right = 7,
	left = 7,
	widget = wibox.container.margin,
})

local function toogle_time_format()
	if time.format ~= format then
		time.format = format
	else
		time.format = format_long
	end
end

widget:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		toogle_time_format()
	end
	if button == 3 then
		calendar:toggle()
	end
end)

return widget
