require("nvterm").setup({
    terminals = {
        shell = "pwsh",
        type_opts = {
            float = {
                relative = 'editor',
                row = 0.3,
                col = 0.25,
                width = 0.5,
                height = 0.4,
                border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = .3, },
            vertical = { location = "rightbelow", split_ratio = .5 },
        },
    },
    toggle = {
        vertical = "<C-t>",
    },
})
