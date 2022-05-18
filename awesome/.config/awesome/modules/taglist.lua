local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local wibox = require('wibox')
local modkey = RC.vars.modkey
local markup = require('lain').markup

local tags_one = { '  MAIN', ' DEV', ' FILES', ' GAMES', ' SETTINGS', ' OTHER ' }
local icons_one = { ' ', ' ', ' ', ' ', ' ', ' ' }

local tags_two = { '  BROWSER', '\u{007f} ' .. 'DISCORD', ' SPOTIFY', ' KEEPASS ', ' OBS ' }
local icons_two = { ' ', ' ', '\u{007f} ', ' ' }

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
        icons = icons_one
    else
        tags = tags_two
        icons = icons_two
    end

    awful.tag(tags, s, awful.layout.layouts[1])

    local taglist = awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
    })

    return taglist
end

return widget
