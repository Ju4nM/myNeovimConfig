-- setKeyMaps create a set of keymaps
function KeyMap(mode, keys, result, opts)
    local options = { noremap = true }

    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.keymap.set(mode, keys, result, options)
end

local mappings = {
    -- Save file
    { { "n", "i" }, "<C-s>", "<esc>:w<cr>" },

    -- Exit neovim
    { "n", "<space>q", ":q<CR>" },

    -- Fast scrolling
    { "n", "<C-j>", "10<C-e>" },
    { "n", "<C-k>", "10<C-y>" },

    -- Moving lines or code blocks
    -- Visual Mode
    { "v", "<A-j>", ":m '>+1<CR>gv=gv" },
    { "v", "<A-k>", ":m '<-2<CR>gv=gv" },
    -- Normal Mode
    { "n", "<A-j>", ":m .+1<CR>==" },
    { "n", "<A-k>", ":m .-2<CR>==" },
    ---------------------------------------------------------------------

    -- Select All
    { { "n", "i" }, "<C-a>", "<ESC>gg0VG" },

    -- Switch a horizontal split to vertical split
    { "n", "<C-right>", ":windo wincmd H<CR>", { silent = true } },
    { "n", "<C-up>", ":windo wincmd K<CR>", { silent = true } },

    -- Duplicate line
    { "n", "tt", ":t.<CR>", { silent = true } },

    -- Search finished
    { "n", "<leader>n", ":nohlsearch<CR>", { silent = true } },
    ---------------------------------------------------------------------
    -- Toggle nvim tree
    { "n", ",<space>", ":NvimTreeToggle<cr>", { silent = true } },

    -- Buffers
    -- Next buffer
    { "n", "<A-l>", "<ESC>:bn<CR>", { silent = true } },
    -- Previous buffer
    { "n", "<A-h>", "<ESC>:bp<CR>", { silent = true } },
    -- Delete buffer
    { "n", "<A-w>", "<ESC>:bd<CR>", { silent = true } },
    ---------------------------------------------------------------------

    -- Tabs
    -- Normal mode
    { "n", "<Tab>", ">> w" },
    { "n", "<S-Tab>", "<< b" },
    -- Visual mode
    { "v", "<Tab>", ">" },
    { "v", "<S-Tab>", "<" },
    ---------------------------------------------------------------------

    -- Telescope keymaps
    { "n", "<leader>ff", ":Telescope find_files<CR>", { silent = true } }, -- Find file
    { "n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true } }, -- Find string
    { "n", "<leader>fb", ":Telescope buffers<CR>", { silent = true } },
    { "n", "<leader>fh", ":Telescope help_tags<CR>", { silent = true } },
    ---------------------------------------------------------------------

    -- Hope keymaps
    -- normal mode (easymotion-like)
    { "n", "<Leader><Leader>b", "<cmd>HopWordBC<CR>" },
    { "n", "<Leader><Leader>w", "<cmd>HopWordAC<CR>" },
    { "n", "<Leader><Leader>j", "<cmd>HopLineAC<CR>" },
    { "n", "<Leader><Leader>k", "<cmd>HopLineBC<CR>" },

    -- visual mode (easymotion-like)
    { "v", "<Leader><Leader>w", "<cmd>HopWordAC<CR>" },
    { "v", "<Leader><Leader>b", "<cmd>HopWordBC<CR>" },
    { "v", "<Leader><Leader>j", "<cmd>HopLineAC<CR>" },
    { "v", "<Leader><Leader>k", "<cmd>HopLineBC<CR>" },

    -- normal mode (sneak-like)
    { "n", "<leader><leader>s", "<cmd>HopChar2AC<CR>" },
    { "n", "<leader><leader>S", "<cmd>HopChar2BC<CR>" },

    -- visual mode (sneak-like)
    { "v", "<leader><leader>s", "<cmd>HopChar2AC<CR>" },
    { "v", "<leader><leader>S", "<cmd>HopChar2BC<CR>" },

    { "n", "<leader>s", ":HopChar2<CR>" }, -- Move to anywhere of the screen

    -- Toggle NvTerm
    { { "n", "t" }, "<C-t>", function() require("nvterm.terminal").toggle("vertical") end, { silent = true } },
    -- { "n", "<C-t>", ":lua OpenTerminal()<CR>", { silent = true } }
}

-- Close Terminal
function CloseTerminal()
    vim.cmd [[
        q!
    ]]
end

-- Open terminal in vertical split
function OpenTerminal()
    local bufNum = vim.fn.bufnr("%")
    local bufType = vim.fn.getbufvar(bufNum, "&buftype", "not found")

    if bufType == "terminal" then
        vim.cmd("q!")
    else
        vim.cmd([[

            botright vnew term://pwsh
            execute "normal a"
        ]])
        vim.keymap.set("t", "<C-t>", "<C-\\><C-n> :lua CloseTerminal()<CR>", { buffer = true, noremap = true })
    end
end

-- Create all keymaps
for _, map in pairs(mappings) do
    KeyMap(unpack(map))
end
