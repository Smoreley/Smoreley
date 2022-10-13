local functions = require("pato.core.functions")
local log = require("pato.extras.logging")
local config = require("pato.core.config").config

local settings = {}

log.debug("Loading Pato defaults module ...")

settings.load_default_options = function()

    -- Global options
    vim.opt.hidden = true
    vim.opt.updatetime = 200
    vim.opt.timeoutlen = 500

    -- When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again.
    vim.opt.autoread = true

    -- Spell checking
    -- vim.opt.spell = true
    -- vim.opt.spelllang = "en_us"
    -- vim.opt.spellsuggest = "best"

    -- Indentation
    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")

    -- Instead of throwing error when trying to close buffer with unsaved changes, ask to save
    vim.opt.confirm = true

    vim.opt.completeopt = {
        "menu",
        "menuone",
        "preview",
        "noinsert",
        "noselect",
    }

    -- Buffer options
    vim.opt.smartindent = true
    vim.opt.copyindent = true
    vim.opt.preserveindent = true

    -- Highlight the current line
    vim.opt.cursorline = config.pato.line_highlight and true or false

    -- Automatic split locations
    vim.opt.splitright = config.pato.split_right and true or false
    vim.opt.splitbelow = config.pato.split_below and true or false

    -- Enable scroll off
    if config.pato.scrolloff then
        vim.opt.scrolloff = config.pato.scrolloff_amount
    end

    -- Enable showmode
    vim.opt.showmode = config.pato.show_mode and true or false

    -- Enable mouse input
    if config.pato.mouse then
        vim.opt.mouse = "a"
    end

    -- Enable wrapping
    vim.opt.wrap = config.pato.line_wrap and true or false

    -- Enable swap files
    vim.opt.swapfile = config.pato.swap_files and true or false

    -- Set numbering
    if not config.pato.disable_numbering then
        if config.pato.relative_num then
          vim.opt.number = true
          vim.opt.relativenumber = true
        else
          vim.opt.number = true
        end
    end

    -- Enable winwidth
    if config.pato.win_width then
        vim.opt.winwidth = config.pato.win_width_nr
    end

    -- Set local-buffer options
    vim.opt.expandtab = config.pato.expand_tabs and true or false
    vim.opt.tabstop = config.pato.indent
    vim.opt.shiftwidth = config.pato.indent
    vim.opt.softtabstop = config.pato.indent
    vim.opt.colorcolumn = tostring(config.pato.max_columns)
    vim.opt.conceallevel = config.pato.conceallevel
    vim.opt.foldenable = config.pato.foldenable
end

-- Pato Nvim commands
settings.pato_commands = function()
    -- Set a custom command to update Pato Nvim
    -- can be called by using :PatoUpdate
    vim.cmd('command! PatoUpdate lua require("pato.core.functions").update_pato()')
    -- Set a custom command to rollback Pato Nvim version
    -- can be called by using :PatoRollback
    vim.cmd('command! PatoRollback lua require("pato.core.functions").rollback_pato()')
    -- Set a custom command to open Pato Nvim user manual
    -- can be called by using :PatoManual
    vim.cmd('command! PatoManual lua require("pato.core.functions").open_docs()')
    -- Set a custom command to edit Pato Nvim private configurations
    -- can be called by using :PatoConfigs
    vim.cmd('command! PatoConfigs lua require("pato.core.functions").edit_config()')
    -- Set a custom command to reload Pato Nvim custom mappings, autocommands, etc
    -- can be called by using :PatoConfigsReload
    vim.cmd('command! PatoConfigsReload lua require("pato.core.functions").reload_custom_settings()')
    -- Set a custom command to fully reload Pato Nvim and simulate a new Neovim run
    -- can be called by using :PatoReload
    vim.cmd('command! PatoReload lua require("pato.modules.built-in.reloader").full_reload()')
    -- Set a custom command to create a crash report
    -- can be called by using :PatoReport
    vim.cmd('command! PatoReport lua require("pato.core.functions").create_report()')
    -- Set a custom command to display an information dashboard
    -- can be called by using :PatoInfo
    vim.cmd('command! PatoInfo lua require("pato.modules.built-in.info").toggle()')
end

-- Custom pato Nvim options
settings.custom_options = function()
    -- Load user-defined settings from the Neovim field in the pato_config.lua file
    functions.load_custom_settings(config.nvim.functions, "functions")
    functions.load_custom_settings(config.nvim.autocmds, "autocmds")
    functions.load_custom_settings(config.nvim.commands, "commands")
    functions.load_custom_settings(config.nvim.mappings, "mappings")
    functions.load_custom_settings(config.nvim.global_variables, "variables")
    functions.load_custom_settings(config.nvim.options, "options")
end

return settings