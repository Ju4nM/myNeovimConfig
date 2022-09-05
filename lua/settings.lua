-- Leader key
vim.g.mapleader = " "

local configs = {
    rnu = true, -- Relative numbers
    nu = true, -- Numbers
    clipboard = "unnamedplus",
    wrap = false,
    mouse = "a",
    title = true,
    list = false,
    smartcase = true,
    encoding = "UTF-8",

    -- Indent 
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    smartindent = true,
    shiftround = true,
    expandtab = true,
    autoindent = true,
    cindent = true,
    -----------------
    hidden = true,
    lazyredraw = true,
    ttyfast = true,
    showmatch = true,
    showmode = false,
    cursorline = true,
    syntax = "on",
    termguicolors = true,
}

for key, value in pairs(configs) do
    vim.o[key] = value
end
