local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')

local menu = { layout = wibox.layout.fixed.horizontal }

local onreboot = function()
    awful.spawn.with_shell('reboot')
end
local onpoweroff = function()
    awful.spawn.with_shell('shutdown now')
end

local menu_items = {
    { name = 'Reboot', icon = '  ', command = onreboot },
    { name = 'Shutdown', icon = '  ', command = onpoweroff },
}

for _, item in ipairs(menu_items) do
    local icon = {
        text = item.icon,
        widget = wibox.widget.textbox,
    }

    local text = {
        {
            text = item.name,
            widget = wibox.widget.textbox,
        },
        left = 0,
        right = 9,
        layout = wibox.container.margin,
    }

    local row = wibox.widget({
        {
            {
                icon,
                text,
                layout = wibox.layout.fixed.horizontal,
            },
            layout = wibox.container.margin,
        },
        fg = beautiful.bg_focus,
        bg = beautiful.bg_normal,
        widget = wibox.container.background,
    })

    row:connect_signal('mouse::enter', function(c)
        c:set_bg(beautiful.border)
        c.fg = beautiful.fg_normal
    end)
    row:connect_signal('mouse::leave', function(c)
        c:set_bg(beautiful.bg_normal)
        c.fg = beautiful.bg_focus
    end)

    row:buttons(awful.util.table.join(awful.button({}, 1, function()
        item.command()
    end)))

    table.insert(menu, row)
end

local shutdown_button = wibox.widget({
    {
        {
            text = '  ',
            widget = wibox.widget.textbox,
        },
        right = 5,
        top = 5,
        bottom = 5,
        layout = wibox.container.margin,
    },
    fg = beautiful.fg_normal,
    widget = wibox.container.background,
})

local hider = wibox.widget({
    layout = wibox.layout.align.horizontal,
    menu,
    visible = false,
})

shutdown_button:buttons(gears.table.join(awful.button({}, 1, function()
    hider.visible = not hider.visible
    if not hider.visible then
        shutdown_button:set_bg('#00000000')
        shutdown_button.fg = beautiful.fg_normal
    else
        shutdown_button:set_bg(beautiful.border)
        shutdown_button.fg = beautiful.highlight
    end
end)))

local widget = wibox.widget({
    layout = wibox.layout.fixed.horizontal,
    hider,
    shutdown_button,
})

return widget
