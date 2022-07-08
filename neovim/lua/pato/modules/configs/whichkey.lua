return function()
    local wk = require("which-key")
    local presets = require("which-key.plugins.presets")

    -- Disable presets that pato nvim doesn't use
    presets.operators["gc"] = nil

    wk.setup({
        plugins = {
            marks = false,
            registers = false,
            presets = {
                operators = false,
                motions = true,
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true,
            },
        },
        operators = {
            d = "Delete",
            c = "Change",
        },
        key_labels = {
            ["<space>"] = "SPC",
            ["<cr>"] = "RET",
            ["<tab>"] = "TAB",
        },
        window = {
            padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
            border = "single",
        },
        layout = {
            height = { min = 1, max = 10 }, -- min and max height of the columns
            spacing = 3,
            align = "left",
        },
        ignore_missing = true,
        hidden = {
            "<silent>",
            "<Cmd>",
            "<cmd>",
            "<Plug>",
            "call",
            "lua",
            "^:",
            "^ ",
        }, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        triggers = "auto", -- automatically setup triggers
    })

    local mappings = {
        ["`"] = { "Find file" },
        -- ["."] = { "Browse files" },
        -- [","] = { "Switch buffer" },
        -- ["/"] = { "Search a word" },
        -- [":"] = { "Command history" },
        -- ["h"] = { "Manpage" },
        ["b"] = {
            name = "+buffers",
            ["]"] = { "Next buffer" },
            ["["] = { "Previous buffer" },
            ["b"] = { "Switch to other buffer" },
            ["g"] = { "Goto buffer" },
        },
        ["c"] = {
            name = "+code",
        },
        ["f"] = {
            name = "+file",
            ["c"] = { "Edit Neovim configuration" },
            ["n"] = { "Create a new unnamed buffer" },
            ["f"] = { "Find files" },
            ["t"] = { "Help tags" },
            ["r"] = { "Recently opened files" },
        },
        ["g"] = {
            name = "+git",
        },
        ["p"] = {
            name = "+plugin",
        },
        ["q"] = {
            name = "+quit",
            ["q"] = { "Quit" },
            ["w"] = { "Save and quit" },
            ["r"] = { "Restore previously saved session" },
        },
        ["s"] = {
            name = "+search",
            ["g"] = { "Grep" },
            ["b"] = { "Buffer" },
            ["s"] = { "Goto symbol" },
            ["h"] = { "Command history" },
            ["m"] = { "Jump to mark" },
        },
        ["w"] = {
            name = "+window",
        },
    }

    -- local is_plugin_disabled = require("pato.utils").is_plugin_disabled


    wk.register(mappings, { prefix = "<leader>" })
end
