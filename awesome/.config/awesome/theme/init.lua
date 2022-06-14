local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi
local gfs = require('gears.filesystem')
local themes_path = gfs.get_themes_dir()
local config_path = gfs.get_dir('config')
local shape = require('gears.shape')
local wibox = require('wibox')
local theme = {}

theme.red = '#E06C75'
theme.green = '#98C379'
theme.blue = '#65aaee'
theme.normal = '#1E1F29'
theme.highlight = '#6E5991'
theme.border = '#282a36'

theme.font = 'JetBrainsMono Nerd Font Bold ' .. dpi(9)

theme.bg_normal = theme.normal
theme.bg_focus = theme.highlight
theme.bg_urgent = theme.red
theme.bg_minimize = theme.border
theme.bg_systray = theme.normal

theme.fg_normal = '#6E5991'
theme.fg_focus = theme.normal
theme.fg_urgent = theme.red

theme.bar_height = dpi(26)
theme.useless_gap = dpi(4)
theme.border_width = dpi(2)
theme.corner_radius = dpi(4)

theme.border_normal = theme.normal
theme.border_focus = '#403355'

theme.bg_systray = '#1B1721'
theme.systray_icon_spacing = dpi(6)

-- theme.taglist_font = 'ShureTechMono Nerd Font Mod 15'
theme.taglist_font = 'JetBrainsMono Nerd Font Bold ' .. dpi(10)
theme.taglist_fg_focus = theme.blue
theme.taglist_fg_occupied = theme.highlight
theme.taglist_bg_focus = theme.normal
theme.taglist_fg_empty = theme.border
theme.taglist_bg_empty = '#1B1721'
theme.taglist_bg_focus = '#1B1721'
theme.taglist_bg_occupied = '#1B1721'
theme.taglist_bg_urgent = '#1B1721'
theme.taglist_fg_urgent = theme.green

theme.notification_height = 100
theme.notification_bg = theme.normal
theme.notification_fg = theme.blue
theme.notification_icon_size = 95

theme.menu_submenu_icon = themes_path .. 'default/submenu.png'
theme.menu_height = 15
theme.menu_width = 100
theme.notification_margin = 40

-- stylua: ignore start

theme.layout_fairh      = config_path .. 'theme/layouts/dracula/fairhw.png'
theme.layout_fairv      = config_path .. 'theme/layouts/dracula/fairvw.png'
theme.layout_floating   = config_path .. 'theme/layouts/dracula/floatingw.png'
theme.layout_magnifier  = config_path .. 'theme/layouts/dracula/magnifierw.png'
theme.layout_max        = config_path .. 'theme/layouts/dracula/maxw.png'
theme.layout_fullscreen = config_path .. 'theme/layouts/dracula/fullscreenw.png'
theme.layout_tilebottom = config_path .. 'theme/layouts/dracula/tilebottomw.png'
theme.layout_tileleft   = config_path .. 'theme/layouts/dracula/tileleftw.png'
theme.layout_tile       = config_path .. 'theme/layouts/dracula/tilew.png'
theme.layout_tiletop    = config_path .. 'theme/layouts/dracula/tiletopw.png'
theme.layout_spiral     = config_path .. 'theme/layouts/dracula/spiralw.png'
theme.layout_dwindle    = config_path .. 'theme/layouts/dracula/dwindlew.png'
theme.layout_cornernw   = config_path .. 'theme/layouts/dracula/cornernww.png'
theme.layout_cornerne   = config_path .. 'theme/layouts/dracula/cornernew.png'
theme.layout_cornersw   = config_path .. 'theme/layouts/dracula/cornersww.png'
theme.layout_cornerse   = config_path .. 'theme/layouts/dracula/cornersew.png'
theme.layout_centerwork = config_path .. 'theme/layouts/dracula/centerwork.png'
theme.layout_termfair   = config_path .. 'theme/layouts/dracula/fairhw.png'

-- stylua: ignore end

theme.tasklist_bg_normal = '#1B1721'
theme.tasklist_bg_minimize = theme.border
theme.tasklist_bg_focus = theme.border_focus

theme.widget_bg = '#1B1721'
theme.widget_gap = dpi(4)
theme.widget_border = dpi(3)
theme.widget_shape = function(cr, w, h)
    shape.rounded_rect(cr, w, h - theme.widget_border, theme.corner_radius)
end

theme.widget_style = function(widget)
    widget = wibox.container.margin(widget, 0, 0, 0, dpi(1))
    widget = wibox.container.background(widget, theme.widget_bg, theme.widget_shape)
    widget.shape_border_width = dpi(1)
    widget.shape_border_color = theme.border
    widget = wibox.container.margin(widget, theme.widget_gap, theme.widget_gap, theme.widget_border, 0)
    return widget
end

return theme
