local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')
local modkey = RC.vars.modkey

local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t)
        t:view_only()
    end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({}, 4, function(t)
        awful.tag.viewnext(t.screen)
    end),
    awful.button({}, 5, function(t)
        awful.tag.viewprev(t.screen)
    end)
)

local tags_one = { 'MAIN', 'DEV', 'FILES', 'GAMES', 'SETTINGS', 'OTHER' }
local icons_one = { ' ', ' ', ' ', ' ', ' ', '' }

local tags_two = { 'BROWSER', 'DISCORD', 'SPOTIFY', 'KEEPASS', 'OBS' }
local icons_two = { ' ', ' ', '\u{007f} ', ' ', ' ' }

local widget = function(screen)
    local tags = screen.index == 1 and tags_one or tags_two
    awful.tag(tags, screen, awful.layout.layouts[1])

    local taglist = awful.widget.taglist({
        screen = screen,
        filter = awful.widget.taglist.filter.all,
        style = { shape = beautiful.widget_shape },
        widget_template = {
            {
                {
                    {
                        id = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                top = -beautiful.useless_gap * 0.5,
                left = 7,
                right = 7,
                widget = wibox.container.margin,
            },
            id = 'background_role',
            widget = wibox.container.background,
            create_callback = function(self, c3, index, objects)
                self:connect_signal('mouse::enter', function()
                    if self.bg ~= '#453A5C' then
                        self.backup = self.bg
                        self.has_backup = true
                    end
                    self.bg = '#453A5C'
                end)
                self:connect_signal('mouse::leave', function()
                    if self.has_backup then
                        self.bg = self.backup
                    end
                end)
            end,
            update_callback = function(self, c3, index, objects) end,
        },
        buttons = taglist_buttons,
    })
    taglist = beautiful.widget_style(taglist)
    return taglist
end

return widget
