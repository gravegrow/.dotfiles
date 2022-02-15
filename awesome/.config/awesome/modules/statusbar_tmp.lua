local awful = require("awful")
local wibox = require("wibox")
local widgets = require("modules.widgets")

local bar = wibox.widget
{

}

local function statusbar(s)
end

awful.screen.connect_for_each_screen (function(s) statusbar(s) end)
