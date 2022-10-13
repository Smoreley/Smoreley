-- https://github.com/glepnir/dashboard-nvim
return function()
    local db = require("dashboard")

    vim.g.dashboard_session_directory = require("pato.core.system").pato_root .. "/sessions"
    vim.g.dashboard_default_executive = "telescope"

    -- Custom Center
    db.custom_center = {
        {
            icon = "  ",
            desc = "Load Last Session              ",
            shortcut = "SPC q r",
            action = "lua require('persistence').load({ last = true })",
        },
        {
            icon = "  ",
            desc = "Recently Opened Files          ",
            shortcut = "SPC f r",
            action = "lua require('telescope.builtin').oldfiles()",
        },
        {
            icon = "  ",
            desc = "Jump to Bookmark               ",
            shortcut = "SPC s m",
            action = "lua require('telescope.builtin').marks()",
        },
        {
            icon = "  ",
            desc = "Find File                      ",
            shortcut = "SPC f f",
            action = "lua require('telescope.builtin').find_files()",
        },
        {
            icon = "  ",
            desc = "Find Word                      ",
            shortcut = "SPC s g",
            action = "lua require('telescope.builtin').live_grep()",
        },
        {
            icon = "  ",
            desc = "Open Configuration             ",
            shortcut = "SPC f c",
            action = "lua require('pato.core.functions').edit_config()",
        },
        {
            icon = "  ",
            desc = "Open Documentation             ",
            shortcut = "SPC d d",
            action = "lua require('pato.core.functions').open_docs()",
        },
    }

    -- Custom Footer
    db.custom_footer = {
        "", -- add 'newline' padding between `custom_center` and `custom_footer`
        "Pato Nvim loaded in " .. vim.fn.printf(
            "%.3f",
            vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
        ) .. " seconds.",
        -- default_footer,
        '🎉 loaded '.. #vim.tbl_keys(packer_plugins) .. ' plugins.',
    }

    -- always show tabline & statusline
    db.hide_tabline = false
    db.hide_statusline = false

    -- Custom Header (default)
    db.custom_header = {
        "█▀█ ▄▀█ ▀█▀ █▀█",
        "█▀▀ █▀█ ░█░ █▄█",
        "",
        "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣉⡥⠶⢶⣿⣿⣿⣿⣷⣆⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⡿⢡⡞⠁⠀⠀⠤⠈⠿⠿⠿⠿⣿⠀⢻⣦⡈⠻⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⡇⠘⡁⠀⢀⣀⣀⣀⣈⣁⣐⡒⠢⢤⡈⠛⢿⡄⠻⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⡇⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠉⠐⠄⡈⢀⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⠇⢠⣿⣿⣿⣿⡿⢿⣿⣿⣿⠁⢈⣿⡄⠀⢀⣀⠸⣿⣿⣿⣿",
        "⣿⣿⣿⣿⡿⠟⣡⣶⣶⣬⣭⣥⣴⠀⣾⣿⣿⣿⣶⣾⣿⣧⠀⣼⣿⣷⣌⡻⢿⣿",
        "⣿⣿⠟⣋⣴⣾⣿⣿⣿⣿⣿⣿⣿⡇⢿⣿⣿⣿⣿⣿⣿⡿⢸⣿⣿⣿⣿⣷⠄⢻",
        "⡏⠰⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⢂⣭⣿⣿⣿⣿⣿⠇⠘⠛⠛⢉⣉⣠⣴⣾",
        "⣿⣷⣦⣬⣍⣉⣉⣛⣛⣉⠉⣤⣶⣾⣿⣿⣿⣿⣿⣿⡿⢰⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⣿⣿⣿⣿⣿⣿⣿⣿⡇⣼⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢸⣿⣿⣿⣿⣿⣿⣿⠁⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "",
    }

end