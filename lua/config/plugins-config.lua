-- Status bar config
require("plugins.lualineConfig")

-- Nvim Tree config
require("plugins.nvimtreeConfig")

-- Buffer line
require("plugins.bufferlineConfig")

-- Nvim Commenter
require("nvim_comment").setup()

-- Indent blankline
require("plugins.blankLine")

-- Nvim Surround
require("nvim-surround").setup()

-- Nvim autopairs
require("nvim-autopairs").setup()

-- TreeSitter
require("plugins.nvimTreesitter")

-- Telescope
require("plugins.telescope")

-- Hop (Snake + easymotion)
require("hop").setup()

-- NvTerminal
require("plugins.nvTerminal")

-- Onedark
require("onedark").setup({
    style = "deep",
    transparent = true,
    term_colors = true,
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
})

vim.cmd [[
    colorscheme onedark
]]

-- Colorizer
require("plugins.colorizer")
