local gears = require('gears')
local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local _M = {}

local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal('request::activate', 'tasklist', { raise = true })
        end
    end),
    awful.button({}, 3, function()
        -- awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({}, 4, function()
        awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
    end)
)

function _M.init(s)
    local tasklist = awful.widget.tasklist({
        screen = s,
        style = { shape = beautiful.widget_shape },
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        layout = {
            spacing = beautiful.widget_gap,
            layout = wibox.layout.fixed.horizontal,
        },
        widget_template = {
            {
                {
                    {
                        {
                            {
                                id = 'clienticon',
                                widget = awful.widget.clienticon,
                            },
                            left = 8,
                            right = 8,
                            top = 1,
                            bottom = 1,
                            widget = wibox.container.margin,
                        },
                        wibox.widget.base.make_widget(),
                        bg = beautiful.bg_secondary,
                        shape = function(cr, w)
                            gears.shape.rounded_rect(
                                cr,
                                w,
                                beautiful.bar_height - beautiful.widget_margin * 3 + 1,
                                beautiful.widget_corner_radius
                            )
                        end,
                        widget = wibox.container.background,
                    },
                    left = 1,
                    right = 1,
                    top = 1,
                    bottom = 1,
                    widget = wibox.container.margin,
                },
                wibox.widget.base.make_widget(),
                id = 'background_role',
                widget = wibox.container.background,
            },
            create_callback = function(self, c, _, _)
                self:get_children_by_id('clienticon')[1].client = c
            end,
            layout = wibox.layout.fixed.horizontal,
        },
    })

    tasklist = wibox.container.margin(tasklist, beautiful.widget_gap, beautiful.widget_gap, beautiful.widget_margin, 0)
    return tasklist
end

return _M
