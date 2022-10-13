return function()
    local wk = require("which-key")
    local presets = require("which-key.plugins.presets")

    -- disable presets that pato nvim doesn't use
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
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "+", -- symbol prepended to a group
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
        -- ["m"] = { "Save" },
        -- ["v"] = { "Save" },
        ["b"] = {
            name = "+buffers",
            ["c"] = { "Close current buffer" },
            ["f"] = { "Format buffer" },
            ["]"] = { "Next buffer" },
            ["["] = { "Previous buffer" },
            ["b"] = { "Switch to other buffer" },
            ["g"] = { "Goto buffer" },
            ["n"] = { "Next buffer" },
            ["p"] = { "Previous buffer" },
        },
        ["c"] = {
            name = "+code",
            ["d"] = {
                name = "+debug",
                ["b"] = { "Toggle breakpoint on current line" },
            },
            ["l"] = {
                name = "+lsp",
                ["i"] = { "Lsp info" },
            },
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
            ["s"] = { "Status" },
            ["b"] = { "Branches" },
            ["c"] = { "Commits" },
        },
        ["p"] = {
            name = "+plugin",
            ["c"] = { "Clean disabled or unused plugins" },
            ["i"] = { "Install missing plugins" },
            ["p"] = { "Profile the time taken loading your plugins" },
            ["s"] = { "Sync your plugins" },
            ["C"] = { "Compile your plugins changes" },
            ["S"] = { "Plugins status" },
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
        ["t"] = {
            ["s"] = { "spell" },
        },
        ["w"] = {
            name = "+window",
            ["h"] = { "Window left" },
            ["j"] = { "Window below" },
            ["l"] = { "Window right" },
            ["k"] = { "Window up" },
            ["="] = { "Balance window" },
            ["s"] = { "Split window below" },
            ["v"] = { "Split window right" },
        },
        ["o"] = {
            name = "+open",
            ["d"] = { "Start screen" },
            ["e"] = { "Tree Explorer" },
            ["s"] = { "Symbols" },
            ["t"] = { "Terminal" },
        },
        ["j"] = {
            name = "+jumps",
            ["a"] = { "Alternate file" },
            ["j"] = { "jump back" },
            ["k"] = { "jump forward" },
        },
    }

    -- local is_plugin_disabled = require("pato.utils").is_plugin_disabled
    wk.register(mappings, { prefix = "<leader>" })
end
