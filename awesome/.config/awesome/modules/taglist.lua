local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local wibox = require('wibox')
local modkey = RC.vars.modkey
local markup = require('lain').util.markup

local tags_one = { 'MAIN', 'DEV', 'FILES', 'GAMES', 'SETTINGS', 'OTHER' }
local icons_one = { ' ', ' ', ' ', ' ', ' ', '' }

local tags_two = { 'BROWSER', 'DISCORD', 'SPOTIFY', 'KEEPASS', 'OBS' }
local icons_two = { ' ', ' ', '\u{007f} ', ' ', ' ' }

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

local function widget(s)
    local tags = {}
    local icons = {}
    if s == screen[1] then
        tags = tags_one
        -- tags = icons_one
    else
        tags = tags_two
        -- tags = icons_two
    end

    awful.tag(tags, s, awful.layout.layouts[1])

    local taglist = awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        widget_template = {
            {
                {
                    {
                        id = 'icon_role',
                        widget = wibox.widget.textbox,
                    },
                    {
                        id = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left = 7,
                right = 7,
                bottom = 5,
                widget = wibox.container.margin,
            },
            widget = wibox.container.background,
            create_callback = function(self, c3, index, objects)
                -- self:get_children_by_id('icon_role')[1].markup = markup.font(beautiful.icon_font, icons[index])
                self:connect_signal('mouse::enter', function()
                    if self.bg ~= '#423958' then
                        self.backup = self.bg
                        self.has_backup = true
                    end
                    self.bg = '#423958'
                end)
                self:connect_signal('mouse::leave', function()
                    if self.has_backup then
                        self.bg = self.backup
                    end
                end)
            end,
            update_callback = function(self, c3, index, objects) --luacheck: no unused args
                -- self:get_children_by_id('icon_role')[1].text = icons[index]
            end,
        },
    })

    return taglist
end

return widget
