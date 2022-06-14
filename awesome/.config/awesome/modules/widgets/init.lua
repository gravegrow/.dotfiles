local widgets = {
    -- taglist = require('modules.widgets.taglist'),
    kb = require('modules.widgets.kb_layout'),
    systray = require('modules.widgets.systray'),
    shutdown = require('modules.widgets.shutdown'),
    time = require('modules.widgets.time'),
    volume = require('modules.widgets.volume')(),
}

return widgets
