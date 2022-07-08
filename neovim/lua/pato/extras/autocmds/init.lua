local utils = require("pato.utils")
local log = require("pato.extras.logging")
local config = require("pato.core.config").config

log.debug("Loading Pato autocmds module ...")

local autocmds = {
	pato_core = {

	}
}

-- Set numbering
if not config.pato.disable_numbering then
	if config.pato.relative_num then
		table.insert(autocmds["pato_core"], {
			"BufEnter,WinEnter",
			"*",
			"if &nu | set rnu | endif",
		})
	else
		table.insert(autocmds["pato_core"], {
			"BufEnter,WinEnter",
			"*",
			"if &nu | set nornu | endif",
		})
	end
end

-- Install plugins on launch
if config.pato.auto_install_plugins then
	vim.defer_fn(function()
		-- Check if there is only packer installed so we can decide if we should
		-- use PackerInstall or PackerSync, useful for generating the
		-- `plugin/packer_compiled.lua` on first pato launch
		if vim.tbl_count(vim.fn.globpath(vim.fn.stdpath("data") .. "/site/pack/packer/opt", "*", 0, 1)) == 1 then
			vim.cmd("PackerSync")
		else
			-- Clean disabled plugins
			vim.cmd("PackerClean")
				-- Defer the installation of new plugins to avoid a weird bug where packer
				-- tries to clean the plugins that are being installed right now
				vim.defer_fn(function()
					-- Install the plugins
					vim.cmd("PackerInstall")
				end, 200)
		end
	end, 400)
end

-- Enable auto comment
if not config.pato.auto_comment then
	vim.opt.formatoptions:remove({ "c", "r", "o" })
end

-- Create augroups
utils.create_augroups(autocmds)