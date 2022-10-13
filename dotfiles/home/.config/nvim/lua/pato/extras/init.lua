-- This file loads all extra components

require("pato.extras.logging").debug("Loading Pato extras ...")

local extra_modules = { "keybindings" }

local disabled_autocommands = require("pato.core.config").config.pato.disable_autocommands
if not disabled_autocommands then
	vim.list_extend(extra_modules, { "autocmds" })
end

require("pato.utils.modules").load_modules("pato.extras", extra_modules)