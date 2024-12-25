local function spell_status()
    if vim.opt.spell:get() then
        return '󰓆'
    else
        return ''
    end
end

local function paste_status()
    if vim.opt.paste:get() then
        return 'P'
    else
        return ''
    end
end

local function current_tag()
    return vim.api.nvim_eval('tagbar#currenttag(\'%\', \'\')')
end

return {
    "nvim-lualine/lualine.nvim",
    opts = function()
        return {
            options = {
                theme = 'auto',
                icons_enabled = true,
                component_separators = {left = '', right = ''},
                section_separators = {left = '', right = ''},
            },
            sections = {
                lualine_a = {'mode', spell_status, paste_status},
                lualine_b = {'diff', 'diagnostics'},
                lualine_x = {
                    current_tag,
                    'encoding',
                    'fileformat',
                    {
                        'filetype',
                        colored = false,
                    }
                },
            },
            extensions = {
                'nvim-tree',
                'quickfix',
                'symbols-outline',
            },
        }
    end,
}
