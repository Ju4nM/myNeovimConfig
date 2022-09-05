local colors = {
    darkgray = "#16161d",
    gray = "#727169",
    innerbg = nil,
    outerbg = "#16161D",
    normal = "#ffae57", -- "#7e9cd8",
    insert = "#BBE67E", -- "#98bb6c",
    visual = "#F07178", -- "#ffa066",
    replace = "#D4BFFF", -- "#e46876",
    command = "#e6c384",
}

function getLSP ()
    local msg = 'No active LSP'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end
    return msg
end

function TransparentTheme ()

    return {
        inactive = {
            a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
            b = { fg = colors.inactive, bg = colors.darkgray },
            c = { fg = colors.gray, bg = colors.innerbg },
        },
        visual = {
            a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
            b = { fg = colors.visual, bg = colors.darkgray },
            c = { fg = colors.gray, bg = colors.innerbg},
        },
        replace = {
            a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
            b = { fg = colors.replace, bg = colors.darkgray },
            c = { fg = colors.gray, bg = colors.innerbg },
        },
        normal = {
            a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
            b = { fg = colors.normal, bg = colors.darkgray },
            c = { fg = colors.gray, bg = colors.innerbg },
            -- b = { fg = colors.gray, bg = colors.visual },
        },
        insert = {
            a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
            b = { fg = colors.insert, bg = colors.darkgray },
            c = { fg = colors.gray, bg = colors.innerbg },
        },
        command = {
            a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
            b = { fg = colors.command, bg = colors.darkgray },
            c = { fg = colors.gray, bg = colors.innerbg },
        },
    }
end


require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = TransparentTheme(),
        component_separators = { left = '', right = '', middle = "|"}, -- { left = '', right = ''},
        section_separators = { left = "", right = "" }, -- { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
            "NvimTree",
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            { "branch", separator = { right =  ""}, color = { bg = "#2f2f2f" } },
            'diff',
            'diagnostics'
        },
        lualine_c = { 'filename' },
        lualine_x = { { getLSP, icon = "", color = { fg = colors.gray, gui = 'bold' } }, 'encoding', 'filetype' },
        lualine_y = { "progress" },
        lualine_z = { "%l/%L : %c" }
    },
}
