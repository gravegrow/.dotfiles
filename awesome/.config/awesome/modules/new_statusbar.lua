local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')

local function process_config(screen, args)
    local _C = {}

    _C.side = args.side or 'top'
    _C.border_width = args.border_width or 0
    _C.opacity = args.opacity or 1
    _C.bg_color = args.bg_color or nil
    _C.border_color = args.border_color or nil

    local x_offset = args.x_offset or 0
    local y_offset = args.y_offset or 0
    local height = args.height or 30

    local is_top = _C.side == 'top'
    local is_bot = _C.side == 'bottom'
    local is_left = _C.side == 'left'
    local is_right = _C.side == 'right'

    local geo = screen.geometry

    local tbl_positon_x = geo.x + x_offset * 2
    local right_positon_x = geo.x + geo.width - x_offset * 2 - height

    local lrt_positon_y = geo.y + y_offset * 2
    local bot_positon_y = geo.y + geo.height - y_offset * 2 - height

    _C.x_offset = is_right and right_positon_x or tbl_positon_x
    _C.y_offset = is_bot and bot_positon_y or lrt_positon_y

    _C.height = (is_left or is_right) and geo.height - y_offset * 4 - _C.border_width * 2 or height
    _C.width = (is_top or is_bot) and geo.width - x_offset * 4 - _C.border_width * 2 or height

    _C.strut_size = height + ((is_top or is_bot) and y_offset or x_offset) * 2
    _C.layout_direction = (is_top or is_bot) and 'horizontal' or 'vertical'

    local ids = 'abcmxyz'
    for idx = 1, #ids do
        local block = 'block_' .. ids:sub(idx, idx)
        _C[block] = args[block] or {}
        _C[block].layout = wibox.layout.fixed[_C.layout_direction]
    end

    _C.shape = function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, 0)
    end

    return _C
end

local function statusbar(screen, args)
    local config = process_config(screen, args)

    screen.holder = wibox({
        visible = true,
        screen = screen,
        type = 'dock',
        height = config.height,
        width = config.width,
        shape = config.shape,
        opacity = config.opacity,
        bg = config.bg_color,
        x = config.x_offset,
        y = config.y_offset,
        border_width = config.border_width,
        border_color = config.border_color,
    })

    local struts = {}
    struts[config.side] = config.strut_size
    screen.holder:struts(struts)

    screen.holder:setup({
        layout = wibox.layout.align[config.layout_direction],
        expand = 'outside',
        {
            layout = wibox.layout.fixed[config.layout_direction],
            config.block_a,
            config.block_b,
            config.block_c,
        },
        {
            layout = wibox.layout.fixed[config.layout_direction],
            config.block_m,
        },
        {
            layout = wibox.layout.align[config.layout_direction],
            nil,
            nil,
            {
                layout = wibox.layout.fixed[config.layout_direction],
                config.block_x,
                config.block_y,
                config.block_z,
            },
        },
    })
end

function toggle()
    local id = awful.screen.focused('mouse')
    screen[id].holder.visible = not screen[id].holder.visible
end

awful.screen.connect_for_each_screen(function(screen)
    local layoutbox = require('modules.widgets.layoutbox')
    local taglist = require('modules.widgets.taglist')(screen)
    local widgets = require('modules.widgets')
    local tasklist = require('modules.widgets.tasklist').init(screen)
    local systray = screen.index == 1 and widgets.systray or nil

    local options = {
        side = 'top',
        height = beautiful.bar_height,
        x_offset = 1 * beautiful.useless_gap,
        y_offset = 0.5 * beautiful.useless_gap,
        opacity = 0.80,
        bg_color = beautiful.bg_normal,
        border_width = 1,
        border_color = '#282A36',
        block_a = { layoutbox },
        block_b = { taglist, tasklist },
        block_c = {},
        block_m = {},
        block_x = {},
        block_y = { widgets.kb, widgets.volume, systray, widgets.time.setup() },
        block_z = { widgets.shutdown },
    }

    statusbar(screen, options)
end)

-- toggle()
