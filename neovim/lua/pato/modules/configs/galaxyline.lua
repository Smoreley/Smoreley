-- https://github.com/NTBBloodbath/galaxyline.nvim
return function()
    local utils = require("pato.utils")
    local config = require("pato.core.config").config
    local colors = require("galaxyline.themes.colors").get_color

    local gl = require("galaxyline")
    local lsp = require("galaxyline.providers.lsp")
    local buffer = require("galaxyline.providers.buffer")
    local condition = require("galaxyline.condition")

    local gls = gl.section

    gl.short_line_list = {
        "NvimTree",
        "packer",
        "minimap",
        "Outline",
        "toggleterm",
        "netrw",
    }

    -- Left side
    gls.left[1] = {
        RainbowLeft = {
            provider = function()
                return "▊ "
            end,
            highlight = { colors("blue"), colors("bg") },
        },
    }

    gls.left[2] = {
        ViMode = {
            provider = function()
                -- auto change color according the vim mode
                -- TODO: find a less dirty way to set ViMode colors
                local mode_color = {
                    n = colors("red"),
                    i = colors("green"),
                    v = colors("blue"),
                    [""] = colors("blue"),
                    V = colors("blue"),
                    c = colors("magenta"),
                    no = colors("red"),
                    s = colors("orange"),
                    S = colors("orange"),
                    [""] = colors("orange"),
                    ic = colors("yellow"),
                    R = colors("magenta"),
                    Rv = colors("magenta"),
                    cv = colors("red"),
                    ce = colors("red"),
                    r = colors("cyan"),
                    rm = colors("cyan"),
                    ["r?"] = colors("cyan"),
                    ["!"] = colors("red"),
                    t = colors("red"),
                }
                vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()]())
                return "  "
            end,
            highlight = { colors("red"), colors("bg"), "bold" },
        },
    }
end