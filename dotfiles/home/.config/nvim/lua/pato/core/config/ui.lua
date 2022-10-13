local utils = require("pato.utils")
local log = require("pato.extras.logging")
local config = require("pato.core.config").config

log.debug("Loading Pato UI module ...")

-- vim.cmd[[colorscheme nord]]
-- vim.cmd("colorscheme nightfox")
-- vim.cmd("colorscheme monokai_pro")
vim.cmd[[colorscheme tokyonight]]
-- vim.cmd("colorscheme kanagawa")
-- require('moonlight').set()
-- vim.cmd("colorscheme middlenight_blue")

-- Set custom WhichKey background
vim.cmd("highlight WhichKeyFloat guibg=" .. config.pato.whichkey_bg)