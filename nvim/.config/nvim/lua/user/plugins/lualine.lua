local colors = {
    red = '#C9616C',
    dim_red = '#5B3741',
    white = '#5C6370',
    gray = '#16161D',
    black = '#111215',
    orange = '#B88861',
    dim_orange = '#6A5443',
    green = '#8FBA80',
    dim_green = '#50624A',
    blue = '#579AD3',
    cian = '#B56ECA',
    bg = '#1E1F29',
}

local theme = {
    normal = {
        a = { fg = colors.white, bg = colors.gray, gui = 'bold' },
        b = { fg = colors.white, bg = colors.gray },
        c = { fg = colors.bg, bg = colors.black },
        x = { fg = colors.bg, bg = colors.black },
        y = { fg = colors.white, bg = colors.gray },
        z = { fg = colors.white, bg = colors.gray, gui = 'bold' },
    },
    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.cian } },
    replace = { a = { fg = colors.black, bg = colors.green } },
    command = { a = { fg = colors.black, bg = colors.orange } },
}

local mode = { 'mode' }
local diagnostics = {
    'diagnostics',
    source = { 'nvim' },
    diagnostics_color = {
        error = { fg = colors.dim_red },
        warn = { fg = colors.dim_orange },
        hint = { fg = colors.dim_white },
    },
}

local diff = {
    'diff',
    symbols = {
        added = ' ',
        modified = '柳',
        removed = ' ',
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
    icon = '',
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
