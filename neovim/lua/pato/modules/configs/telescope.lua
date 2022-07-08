-- https://github.com/nvim-telescope/telescope.nvim
return function()
    local telescope = require("telescope")

    telescope.setup({
        defaults = {
            find_command = {
                "rg",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
            },
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "descending",
            layout_strategy = "horizontal",
            layout_config = {
                width = 0.75,
                preview_cutoff = 120,
                prompt_position = "bottom",
                vertical = { mirror = false },
                horizontal = {
                    mirror = false,
                    preview_width = 0.6,
                },
            },
            scroll_strategy = "cycle",
            border = {},
            borderchars = {
                "─",
                "│",
                "─",
                "│",
                "╭",
                "╮",
                "╯",
                "╰",
            },
            color_devicons = true,
            -- use_less = true, --Depricated
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        },
    })

    -- Load mapper extension
    telescope.load_extension("mapper")
end