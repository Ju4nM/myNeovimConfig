local lspconfig = require('lspconfig')
local masonLspConfig = require("mason-lspconfig");

-- Create a keymap function
function KeyMap(mode, keys, result, opts)
    local options = { noremap = true }

    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.keymap.set(mode, keys, result, options)
end

local on_attach = function(_, bufnr)

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    -- Mappings for on_attach
    local bufopts = { silent = true }
    local bufMaps = {
        { 'n', 'gD', vim.lsp.buf.declaration, bufopts },
        { 'n', 'gd', vim.lsp.buf.definition, bufopts }, -- Go to definition
        { 'n', 'gi', vim.lsp.buf.implementation, bufopts }, -- Go to implementation
        { 'n', 'gr', vim.lsp.buf.references, bufopts }, -- Go to references
        { 'n', 'K', vim.lsp.buf.hover, bufopts },
        { 'n', '<space>ca', vim.lsp.buf.code_action, bufopts },
        { 'n', '<space>f', vim.lsp.buf.formatting, bufopts },
    }

    for _, map in pairs(bufMaps) do
        KeyMap(unpack(map))
    end
end

-- Mappings
local opts = { silent = true }
KeyMap('n', '<space>e', vim.diagnostic.open_float, opts)
KeyMap('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
KeyMap('n', '<leader>dn', vim.diagnostic.goto_next, opts)

function MakeConfig()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    return {
        on_attach = on_attach,
        capabilities = capabilities,
        -- root_dir = function (fname)
            -- return vim.fn.getcwd()
        -- end,
    }
end

-- Hidden virtual text
vim.diagnostic.config({
    virtual_text = false
})

masonLspConfig.setup({
    ensure_installed = { "omnisharp" }
})

-- Load servers on lspconfig
masonLspConfig.setup_handlers {
    function(serverName)
        lspconfig[serverName].setup(MakeConfig())
    end
}
