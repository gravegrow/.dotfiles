local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local tasklist = require('modules.widgets.tasklist')
local layoutbox = require('modules.widgets.layoutbox')
local template = require('modules.widgets.template')
local screens = screen

local widgets = require('modules.widgets')
for index, widget in next, widgets do
    -- widgets[index] = template.default:apply(widget)
end

local function statusbar(screen)
    local taglist = require('modules.taglist')(screen)

    taglist = template.default:apply(taglist)
    local tasklist = template.default:apply(tasklist.init(screen))
    local layoutbox = template.default:apply(layoutbox)
    local filler = template.default:filler()

    local systray = nil

    if screens[screen] == screens[1] then
        systray = wibox.widget({
            layout = wibox.layout.fixed.horizontal,
            filler,
            widgets.systray,
        })
    end

    screen.holder = wibox({
        visible = true,
        screen = screen,
        type = 'dock',
        height = beautiful.bar_height + beautiful.useless_gap,
        width = screen.geometry.width,
        bg = '#00000000',
    })

    screen.holder:struts({ -- collision
        top = beautiful.bar_height,
    })

    screen.holder:setup({
        layout = wibox.layout.align.horizontal,
        expand = 'outside',
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
                    screen.mypromptbox,
                    layout = wibox.layout.fixed.horizontal,
                },
                filler,
                {
                    widgets.kb_layout,
                    filler,
                    widgets.volume,
                    systray,
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
    })

    function toggle()
        local id = awful.screen.focused('mouse')
        screens[id].holder.visible = not screens[id].holder.visible
    end
end

awful.screen.connect_for_each_screen(function(s)
    statusbar(s)
end)
