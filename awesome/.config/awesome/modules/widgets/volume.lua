local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local lain = require('lain')
local gears = require('gears')
local markup = lain.util.markup

local function volume(args)
    args = args
        or {
            unmute = beautiful.fg_normal,
            background = beautiful.normal,
            mute = beautiful.bg_urgent,
        }

    local text = lain.widget.alsa({
        settings = function()
            if volume_now.status == 'off' then
                volume_now.level = markup.fg(args.mute, volume_now.level)
            end

            widget:set_markup(volume_now.level .. ' ')
        end,
    })

    local icon = lain.widget.alsa({
        settings = function()
            local icon = ''
            if volume_now.status == 'off' then
                icon = markup.fg(args.mute, '婢 ')
            else
                icon = markup.fg(args.unmute, '墳 ')
            end

            widget:set_markup(icon)
        end,
    })

    local bar = lain.widget.alsabar({
        colors = {
            unmute = args.unmute,
            background = args.background,
            mute = args.mute,
        },
    })

    local widget = wibox.widget({
        {
            {
                {
                    { widget = icon.widget },
                    right = -5,
                    left = 7,
                    bottom = 0,
                    widget = wibox.container.margin,
                },
                bar.bar,
                text.widget,
                layout = wibox.layout.fixed.horizontal,
            },
            bottom = 3,
            left = 0,
            right = -3,
            widget = wibox.container.margin,
        },
        fg = args.unmute or beautiful.fg_normal,
        widget = wibox.container.background,
    })

    bar.bar.margins = { left = 6, right = 6, top = 6, bottom = 6 }
    bar.bar.paddings = 2
    bar.bar.ticks = 10
    bar.bar.ticks_size = 9
    bar.bar.width = 75

    local function update()
        icon.update()
        bar.update()
        text.update()
    end

    widget:buttons(awful.util.table.join(
        awful.button({}, 1, function() -- left click
            os.execute(string.format('%s set %s toggle', bar.cmd, bar.togglechannel or bar.channel))
            update()
        end),
        awful.button({}, 2, function() -- middle click
            os.execute(string.format('%s set %s toggle', bar.cmd, bar.togglechannel or bar.channel))
            update()
        end),
        awful.button({}, 3, function() -- right click
            awful.spawn('pavucontrol')
        end),
        awful.button({}, 4, function() -- scroll up
            os.execute(string.format('%s set %s 5%%+', bar.cmd, bar.channel))
            update()
        end),
        awful.button({}, 5, function() -- scroll down
            os.execute(string.format('%s set %s 5%%-', bar.cmd, bar.channel))
            update()
        end)
    ))

    globalkeys = gears.table.join(
        globalkeys,
        awful.key({}, '#123', function()
            os.execute(string.format('amixer set %s 5%%+', bar.channel))
            update()
        end),
        awful.key({}, '#122', function()
            os.execute(string.format('amixer set %s 5%%-', bar.channel))
            update()
        end),
        awful.key({}, '#121', function()
            os.execute(string.format('amixer set %s toggle', bar.togglechannel or bar.channel))
            update()
        end)
    )

    return beautiful.widget_style(widget)
end

return volume
