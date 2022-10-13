-- https://github.com/lukas-reineke/indent-blankline.nvim
return function()
    local config = require("pato.core.config").config
    require("indent_blankline").setup({
        enabled = config.pato.show_indent,
        char = "│",
        -- If treesitter plugin is enabled then use its indentation
        use_treesitter = require("pato.utils").check_plugin("nvim-treesitter", "opt"),
        show_first_indent_level = true,
        filetype_exclude = { "help", "dashboard", "packer", "norg", "PatoInfo" },
        buftype_exclude = { "terminal" },
        space_char_blankline = " ",
        -- show_current_context = true,
        -- show_current_context_start = true,
    })
end