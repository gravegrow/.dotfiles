local awful = require('awful')
local beautiful = require('beautiful')
local tags = root.tags()

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    },

    -- Floating clients.
    {
        rule_any = {
            instance = {
                'DTA', -- Firefox addon DownThemAll.
                'copyq', -- Includes session name in class.
                'pinentry',
            },
            class = {
                'Arandr',
                'Blueman-manager',
                'Gpick',
                'Kruler',
                'MessageWin', -- kalarm.
                'Sxiv',
                'Tor Browser', -- Needs a fixed window size to avoid fingerprinting by screen size.
                'Wpa_gui',
                'veromix',
                'xtightvncviewer',
                'Nitrogen',
                'galculator',
                'Galculator',
            },

            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                'Event Tester', -- xev.
                'Hotkey Editor',
                'Attribute Editor',
                'cometRename - 1.20',
                'Bind Skin Options',
                'Extrude Face Options',
                'Bevel Options',
                'Cleanup Options',
                'Resample',
                'Shelf Editor',
                'Orient Constraint Options',
                'Control Tools',
                'Rebuild Curve Options',
                'Facial Rigger',
                'Aim Constraint Options',
                'Duplicate Special Options',
                'Add Influence Options',
                'Parent Constraint Options',
                'Add Attribute.*',
                'Edit Attribute.*',
                'faceHelpImage',
                'Input Selection',
                'Expression Editor',
                'Orient Joint Options',
                'Steam - News',
            },
            role = {
                'AlarmWindow', -- Thunderbird's calendar.
                'ConfigManager', -- Thunderbird's about:config.
                'pop-up', -- e.g. Google Chrome's (detached) Developer Tools.
            },
        },
        properties = { floating = true },
    },

    {
        rule_any = {
            name = { 'Add/Remove Software', 'NVIDIA X Server Settings' },
            class = {
                'pavucontrol',
                'Pavucontrol',
                'nitrogen',
                'Nitrogen',
                'xfce4-settings-manager',
                'Xfce4-settings-manager',
            },
        },
        properties = { tag = tags[5], switchtotag = true },
    },

    {
        rule_any = {
            class = { 'maya.bin', 'Maya-2022' },
        },
        properties = { tag = tags[2], switchtotag = true },
    },

    {
        rule_any = {
            class = { 'spotify', 'Spotify' },
            name = { 'Spotify' },
        },
        properties = { tag = tags[9], switchtotag = true },
    },

    {
        rule_any = {
            class = { 'discord', 'Discord' },
        },
        properties = { tag = tags[8], switchtotag = true },
    },

    {
        rule_any = {
            class = { 'keepassxc', 'KeePassXC' },
        },
        properties = { tag = tags[10], switchtotag = true },
    },

    {
        rule_any = {
            class = { 'obs', 'obs' },
        },
        properties = { tag = tags[11], switchtotag = true },
    },

    {
        rule_any = {
            class = { 'Thunar', 'Thunar', 'Nemo', 'nemo' },
        },
        properties = { tag = tags[3], switchtotag = true },
    },

    {
        rule_any = {
            class = { 'Steam', 'Steam', 'lutris', 'Lutris' },
        },
        properties = { tag = tags[4], switchtotag = true },
    },
}
-- }}}
