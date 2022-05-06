-- stylua: ignore
local shape = require('gears.shape')
local theme_assets = require('beautiful.theme_assets')
local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi
local gfs = require('gears.filesystem')

local themes_path = gfs.get_themes_dir()
local config_path = gfs.get_dir('config')

local theme = {}

theme.red = '#FF5F87'
theme.green = '#87d787'
theme.blue = '#65aaee'
theme.normal = '#1E1F29'
theme.highlight = '#6E5991'
theme.border = '#282a36'

theme.font = 'JetBrainsMono Nerd Font Bold ' .. dpi(9)
theme.icon_font = 'ShureTechMono Nerd Font Mod '

theme.bg_normal = theme.normal
theme.bg_focus = theme.highlight
theme.bg_urgent = theme.red
theme.bg_minimize = theme.normal
theme.bg_systray = theme.normal

theme.fg = theme.blue
theme.fg_normal = theme.blue
theme.fg_focus = theme.normal
theme.fg_urgent = theme.red
theme.fg_minimize = '#FF5F87'

theme.bar_height = dpi(22)
theme.useless_gap = dpi(5)
theme.border_width = dpi(1)
theme.thin_width = dpi(1)
theme.medium_width = dpi(1)
theme.corner_radius = dpi(0)

theme.border_normal = theme.normal
theme.border_focus = theme.border
theme.border_marked = '#91231c'

theme.systray_icon_spacing = 4

theme.taglist_font = 'ShureTechMono Nerd Font Mod ' .. dpi(9)
theme.taglist_spacing = 0
theme.taglist_fg_focus = theme.blue
theme.taglist_fg_occupied = theme.highlight
theme.taglist_bg_focus = theme.normal
theme.taglist_fg_empty = theme.border
theme.taglist_fg_urgent = theme.green
theme.taglist_bg_urgent = theme.normal

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
theme.notification_height = 100
-- notification_[border_color|border_width|shape|opacity]
theme.notification_bg = theme.normal
theme.notification_fg = theme.blue
theme.notification_icon_size = 95
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. 'default/submenu.png'
theme.menu_height = 15
theme.menu_width = 100
theme.notification_margin = 40

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget                = "#cc0000"

-- stylua: ignore start

theme.layout_fairh               = config_path .. 'theme/layouts/dracula/fairhw.png'
theme.layout_fairv               = config_path .. 'theme/ layouts/dracula/fairvw.png'
theme.layout_floating            = config_path .. 'theme/layouts/dracula/floatingw.png'
theme.layout_magnifier           = config_path .. 'theme/layouts/dracula/magnifierw.png'
theme.layout_max                 = config_path .. 'theme/layouts/dracula/maxw.png'
theme.layout_fullscreen          = config_path .. 'theme/layouts/dracula/fullscreenw.png'
theme.layout_tilebottom          = config_path .. 'theme/layouts/dracula/tilebottomw.png'
theme.layout_tileleft            = config_path .. 'theme/layouts/dracula/tileleftw.png'
theme.layout_tile                = config_path .. 'theme/layouts/dracula/tilew.png'
theme.layout_tiletop             = config_path .. 'theme/layouts/dracula/tiletopw.png'
theme.layout_spiral              = config_path .. 'theme/layouts/dracula/spiralw.png'
theme.layout_dwindle             = config_path .. 'theme/layouts/dracula/dwindlew.png'
theme.layout_cornernw            = config_path .. 'theme/layouts/dracula/cornernww.png'
theme.layout_cornerne            = config_path .. 'theme/layouts/dracula/cornernew.png'
theme.layout_cornersw            = config_path .. 'theme/layouts/dracula/cornersww.png'
theme.layout_cornerse            = config_path .. 'theme/layouts/dracula/cornersew.png'
theme.layout_centerwork          = config_path .. 'theme/layouts/dracula/centerwork.png'
theme.layout_termfair            = config_path .. 'theme/layouts/dracula/fairhw.png'

-- stylua: ignore end

theme.tasklist_bg_minimize = theme.highlight
theme.tasklist_disable_task_name = true
theme.tasklist_shape_minimized = function(cr, width, height)
    shape.transform(shape.isosceles_triangle):translate(7, 0)(cr, width / 2, height)
end

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype                 =lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
