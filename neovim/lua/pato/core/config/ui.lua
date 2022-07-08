local utils = require("pato.utils")
local log = require("pato.extras.logging")
local config = require("pato.core.config").config

log.debug("Loading Pato UI module ...")

-- vim.cmd[[colorscheme nord]]
vim.cmd("colorscheme nightfox")
-- vim.cmd[[colorscheme tokyonight]]

-- Set custom WhichKey background
vim.cmd("highlight WhichKeyFloat guibg=" .. config.pato.whichkey_bg)