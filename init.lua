-- Load general settings
require("settings")

-- Load plugins
require("config.packer")

-- Load plugins configs
require("config.plugins-config")

-- Load keymaps
require("config.maps")

-- LSP (Language Server Protocol)
require("lsp-configuration.masonConfig") -- LSP Installer
require("lsp-configuration.lspConfig") -- LSP Configuration
require("lsp-configuration.cmpConfig") -- Autocompletion plugin
