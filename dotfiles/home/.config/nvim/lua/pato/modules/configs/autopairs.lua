return function()
    local is_plugin_disabled = require("pato.utils").is_plugin_disabled
    require("nvim-autopairs").setup({
        check_ts = is_plugin_disabled("treesitter") and false or true,
        enable_afterquote = true,
        enable_moveright = true,
        enable_check_bracket_line = true,
    })
end
