local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local taglist_init = require("modules.taglist")
local tasklist = require("modules.widgets.tasklist")
local layoutbox = require("modules.widgets.layoutbox")
local template = require("modules.widgets.template")
local widgets = require("modules.widgets")

local function bar(s)
    local taglist = taglist_init.main(s)
    local info = nil

    if s == screen[1] then
        info = require("modules.widgets.info_widget")
    elseif s == screen[2] then
        info = require("modules.widgets.time")
    else end

    taglist       = template.default:apply(taglist)
    info          = template.default:apply(info)
    local tasklist      = template.default:apply(tasklist.init(s))
    local layoutbox     = template.default:apply(layoutbox)
    local filler        = template.default:filler()
    local shutdown      = template.default:apply(widgets.shutdown)

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

                filler,
                -- widgets.expand,

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
                    filler,
                    info,
                    filler,
                    shutdown,
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
