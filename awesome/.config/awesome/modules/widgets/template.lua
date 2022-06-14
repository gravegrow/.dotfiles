local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')
local holder = wibox()
local _M = {}

_M.default = {}

local shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 0)
end

function _M.default:apply(widget)
    widget = wibox.container.background(widget, beautiful.bg_normal, shape)
    widget.shape_border_width = beautiful.medium_width
    widget.shape_border_color = beautiful.border
    widget.forced_height = beautiful.bar_height

    local filler = wibox.widget.imagebox()
    filler = wibox.container.background(filler, beautiful.bg_normal, gears.shape.rectangle)
    filler.forced_height = beautiful.useless_gap

    holder:setup({
        layout = wibox.layout.fixed.vertical,
        filler,
        widget,
        nil,
    })

    return holder.widget
end

function _M.default:filler()
    local body = wibox.widget.imagebox()
    body = wibox.container.background(body, beautiful.bg_normal, gears.shape.rectangle)
    body.forced_width = beautiful.useless_gap * 2
    body.forced_height = beautiful.bar_height - beautiful.thin_width

    local border = wibox.container.background(wibox.widget.imagebox(), beautiful.border, gears.shape.rectangle)
    border.forced_height = beautiful.thin_width

    holder:setup({
        layout = wibox.layout.fixed.vertical,
        body,
        border,
    })

    return holder.widget
end

return _M
