-- Install packer if not istalled
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then

    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd [[packadd packer.nvim]]
end


return require("packer").startup(function(use)

    -- Packer
    use 'wbthomason/packer.nvim'

    -- Onedark Theme
    use 'navarasu/onedark.nvim'

    -- Status bar
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
    }

    -- Nvim tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly', -- optional, updated every week. (see issue #1193)
    }

    -- Buffer line
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
    }

    -- For comments
    use { "terrortylor/nvim-comment" }

    -- Indent line
    use { "lukas-reineke/indent-blankline.nvim" }

    -- Nvim surround
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })

    -- Auto pairs
    use {
        "windwp/nvim-autopairs",
    }

    -- TreeSitter
    use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
            "p00f/nvim-ts-rainbow"
        }
    }

    -- Ayu theme
    use "Shatur/neovim-ayu"

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } },
    }

    -- Hop (vim-sneak + easymotion)
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    }

    -------------------------------- Languages --------------------------------
    -- Completion
    use "hrsh7th/nvim-cmp" -- Autocompetion plugin
    -- nvim-cmp dependencies
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    -- Icons for nvim-cmp menu
    use "onsails/lspkind.nvim"

    -- For LSP (Language server protocol)
    use { "neovim/nvim-lspconfig", }

    -- For installation of LSPs
    use {
        "williamboman/mason.nvim",
        'williamboman/mason-lspconfig.nvim'
    }
    ----------------------------------------------------------------

    -- Multi cursors
    use { "mg979/vim-visual-multi", branch = "master" }

    -- NvChad Terminal
    use { "NvChad/nvterm" }

    -- Colorizer
    use 'Akianonymus/nvim-colorizer.lua'

    -- Todo comments
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

end)
