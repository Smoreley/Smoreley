return function()
  local config = require("pato.core.config").config

    require("toggleterm").setup({
        size = config.pato.terminal_height,
        open_mapping = [[<F5>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        start_in_insert = true,
        persist_size = true,
        direction = config.pato.terminal_direction,
        close_on_exit = true,
        float_opts = {
            border = "curved",
            width = config.pato.terminal_width,
            height = config.pato.terminal_height,
            winblend = 0,
            highlights = {
                border = "Special",
                background = "Normal",
            },
        },
    })
end
