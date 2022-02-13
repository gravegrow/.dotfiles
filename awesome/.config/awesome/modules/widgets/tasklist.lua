local gears = require("gears") 
local awful = require("awful") 
local beautiful = require("beautiful") 
local wibox = require("wibox") 
local _M = {}

local tasklist_buttons = gears.table.join(
                 awful.button({ }, 1, function (c)
                                          if c == client.focus then
                                              c.minimized = true
                                          else
                                              c:emit_signal(
                                                  "request::activate",
                                                  "tasklist",
                                                  {raise = true}
                                              )
                                          end
                                      end),
                 awful.button({ }, 3, function()
                                          awful.menu.client_list({ theme = { width = 250 } })
                                      end),
                 awful.button({ }, 4, function ()
                                          awful.client.focus.byidx(1)
                                      end),
                 awful.button({ }, 5, function ()
                                          awful.client.focus.byidx(-1)
                                      end))

function _M.init(s) 
    local tasklist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons  = tasklist_buttons,
        layout   = {
            spacing_widget = {
                {
                    forced_width  = 5,
                    forced_height = 24,
                    thickness     = 2,
                    color         = beautiful.border,
                    widget        = wibox.widget.separator
                },
                valign = 'center',
                halign = 'center',
                widget = wibox.container.place,
            },
            spacing = 1,
            layout  = wibox.layout.fixed.horizontal
        },

    widget_template = {
        nil,
        {
            {
                id     = 'clienticon',
                widget = awful.widget.clienticon,
            },
            left = 4,
            right = -1,
            top = 4,
            widget  = wibox.container.margin,
        },
        {
            wibox.widget.base.make_widget(),
            forced_height = 4,
            id            = 'background_role',
            widget        = wibox.container.background,
        },
        create_callback = function(self, c, index, objects) --luacheck: no unused args
            self:get_children_by_id('clienticon')[1].client = c
        end,
        layout = wibox.layout.align.vertical,
    },
    }
    
    return tasklist
end

return _M
