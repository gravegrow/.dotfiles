local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local tasklist = require("modules.widgets.tasklist")
local layoutbox = require("modules.widgets.layoutbox")
local template = require("modules.widgets.template")
local widgets = require("modules.widgets")

for index, widget in next, widgets do
    widgets[index] = template.default:apply(widget)
end

local function bar(s)
    local taglist = require("modules.taglist")(s)

    taglist       = template.default:apply(taglist)
    local tasklist      = template.default:apply(tasklist.init(s))
    local layoutbox     = template.default:apply(layoutbox)
    local filler        = template.default:filler()

    s.mypromptbox = awful.widget.prompt({ prompt = " Run: " })
    s.mypromptbox.shape = gears.shape.rectangle
    s.mypromptbox.shape_border_width  = beautiful.thin_width
    s.mypromptbox.shape_border_color = beautiful.highlight

    s.holder = wibox ({
        visible = true,
        screen = s,
        type = 'dock',
        height = beautiful.bar_height + beautiful.useless_gap,
        width = s.geometry.width,
        bg = "#00000000",
    })

    s.holder:struts({-- collision
        top = beautiful.bar_height
    })

    s.holder: setup
    {
        layout = wibox.layout.align.horizontal,
        expand = "outside",
        {
            layout = wibox.layout.align.horizontal,
            {
                filler,
                layoutbox,
                filler,
                taglist,
                layout = wibox.layout.fixed.horizontal,
            },
            {
                {
                    filler,
                    tasklist,
                    filler,
                    s.mypromptbox,
                    layout = wibox.layout.fixed.horizontal,
                },
                filler,
                {
                    widgets.kb_layout,
                    filler,
                    widgets.volume,
                    filler,
                    widgets.systray,
                    filler,
                    widgets.time,
                    filler,
                    widgets.shutdown,
                    layout = wibox.layout.fixed.horizontal,
                },
                layout = wibox.layout.align.horizontal,
            },
            filler,
        },
    }

    function toggle()
        local id = awful.screen.focused ("mouse")
        screen[id].holder.visible = not screen[id].holder.visible
    end
end

awful.screen.connect_for_each_screen (function(s) bar(s) end)
