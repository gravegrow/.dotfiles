local colors = {
    red = '#C9616C',
    white = '#282A36',
    grey = '#282A36',
    black = '#111215',
    orange = '#B88861',
    green = '#8FBA80',
    blue = '#579AD3',
    cian = '#B56ECA',
    bg = '#1E1F29',
}

local theme = {
    normal = {
        a = { fg = colors.black, bg = colors.grey },
        b = { fg = colors.black, bg = colors.grey },
        c = { fg = colors.grey, bg = colors.black },
        z = { fg = colors.black, bg = colors.grey },
    },
    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.cian } },
    replace = { a = { fg = colors.black, bg = colors.green } },
    command = { a = { fg = colors.black, bg = colors.orange } },
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
    self.status = ''
    self.applied_separator = ''
    self:apply_highlights(default_highlight)
    self:apply_section_separators()
    return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
    for name, section in pairs(sections) do
        local left = name:sub(9, 10) < 'x'
        for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
            table.insert(section, pos * 2, { empty, color = { fg = colors.black, bg = colors.black } })
        end
        for id, comp in ipairs(section) do
            if type(comp) ~= 'table' then
                comp = { comp }
                section[id] = comp
            end
            comp.separator = left and { right = ' ' } or { left = ' ' }
        end
    end
    return sections
end

local function search_result()
    if vim.v.hlsearch == 0 then
        return ''
    end
    local last_search = vim.fn.getreg('/')
    if not last_search or last_search == '' then
        return ''
    end
    local searchcount = vim.fn.searchcount({ maxcount = 9999 })
    return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
    if vim.bo.modified then
        return '+ '
    elseif vim.bo.modifiable == false or vim.bo.readonly == true then
        return '- '
    end
    return ''
end

require('lualine').setup({
    options = {
        theme = theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
    },
    sections = process_sections({
        lualine_a = { 'mode' },
        lualine_b = {
            'branch',
            'diff',
            {
                'diagnostics',
                source = { 'nvim' },
                sections = { 'error' },
                diagnostics_color = { error = { bg = colors.red, fg = colors.black } },
            },
            {
                'diagnostics',
                source = { 'nvim' },
                sections = { 'warn' },
                diagnostics_color = { warn = { bg = colors.orange, fg = colors.black } },
            },
            { 'filename', file_status = false, path = 1 },
            { modified, color = { bg = colors.red } },
            {
                '%w',
                cond = function()
                    return vim.wo.previewwindow
                end,
            },
            {
                '%r',
                cond = function()
                    return vim.bo.readonly
                end,
            },
            {
                '%q',
                cond = function()
                    return vim.bo.buftype == 'quickfix'
                end,
            },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { search_result, 'filetype', '%l:%c', '%p%%/%L' },
        lualine_z = { { 'fileformat', symbols = { unix = ' UNIX' } } },
    }),
    inactive_sections = {
        lualine_c = {--[[  '%f %y %m'  ]]
        },
        lualine_x = {},
    },
})
