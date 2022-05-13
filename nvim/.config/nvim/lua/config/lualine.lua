local icons = require('colors-and-icons').icons
local colors = require('colors-and-icons').colors

local theme = {
    normal = {
        a = { fg = colors.fg, bg = colors.inactive, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.inactive },
        c = { fg = colors.gray, bg = colors.black },
        x = { fg = colors.gray, bg = colors.black },
        y = { fg = colors.fg, bg = colors.inactive },
        z = { fg = colors.fg, bg = colors.inactive, gui = 'bold' },
    },
    insert = { a = { fg = colors.black, bg = colors.blue, gui = 'bold' } },
    visual = { a = { fg = colors.black, bg = colors.pink, gui = 'bold' } },
    replace = { a = { fg = colors.black, bg = colors.green, gui = 'bold' } },
    command = { a = { fg = colors.black, bg = colors.orange, gui = 'bold' } },
}

local mode = { 'mode' }

local diagnostics = {
    'diagnostics',
    source = { 'nvim' },
    symbols = {
        error = icons.error,
        warn = icons.warning,
        hint = icons.hint,
        info = icons.info,
    },
    diagnostics_color = {
        error = { fg = colors.dim_red },
        warn = { fg = colors.dim_orange },
        info = { fg = colors.dim_blue },
        hint = { fg = colors.dim_blue },
    },
}

local diff = {
    'diff',
    symbols = {
        added = icons.added,
        modified = icons.modified,
        removed = icons.removed,
    },
    diff_color = {
        added = { fg = colors.dim_green },
        modified = { fg = colors.dim_orange },
        removed = { fg = colors.dim_red },
    },
    cond = function()
        return vim.fn.winwidth(0) > 80
    end,
}
local filetype = {
    'filetype',
    colored = false,
    fmt = function(str)
        return str:upper()
    end,
}

local filename = {
    'filename',
    file_status = false,
    path = 1,
    icon = ' ',
    cond = function()
        return vim.fn.winwidth(0) > 40
    end,
}

local fileformat = {
    'fileformat',
    icons_enabled = true,
    symbols = {
        unix = ' unix',
        dos = ' dos',
        mac = ' mac',
    },
    cond = function()
        return vim.fn.winwidth(0) > 90
    end,
}

local cursor = {
    '%l:%c | %L',
    cond = function()
        return vim.fn.winwidth(0) > 60
    end,
    icon = '',
}

require('lualine').setup({
    options = {
        theme = theme,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { diagnostics },
        lualine_c = { fileformat, filename },
        lualine_x = { cursor },
        lualine_y = { diff },
        lualine_z = { filetype },
    },
    inactive_sections = {
        lualine_c = {},
        lualine_x = {},
    },
})
