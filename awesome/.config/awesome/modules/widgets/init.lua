local beautiful = require('beautiful')
local widgets = {}

widgets.kb_layout = require("modules.widgets.kb_layout")
widgets.systray = require("modules.widgets.systray")
widgets.shutdown = require("modules.widgets.shutdown")
widgets.time = require('modules.widgets.time')

widgets.volume = require('modules.widgets.volume')
{
    unmute = beautiful.bg_focus,
    background = '#1B1721',
    mute = beautiful.bg_urgent,
}


return widgets
