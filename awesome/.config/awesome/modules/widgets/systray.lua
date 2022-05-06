local wibox = require("wibox")

local icon_exp, icon_col = "  ", "  "

local text = wibox.widget.textbox(icon_exp)

local hider = wibox.widget({
	{
		widget = text,
	},
	widget = wibox.container.margin,
	right = 2,
	left = -2,
})

local function hider_chager()
	if text.text == icon_exp then
		text.markup = icon_col
	else
		text.markup = icon_exp
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
	bottom = 4,
	widget = wibox.container.margin,
})

local widget = wibox.widget({
	systray,
	hider,
	layout = wibox.layout.fixed.horizontal,
})

hider:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		systray.visible = not systray.visible
		hider_chager()
	end
end)

return widget
