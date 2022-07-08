local log = require("pato.extras.logging")
local utils, fs = require("pato.utils"), require("pato.utils.fs")
local system = require("pato.core.system")
local config = require("pato.core.config").config

local functions = {}

log.debug("Loading Pato functions module ...")

-- Load user-defined settings from the Neovim field in the doom_config.lua
-- @param settings_tbl The settings table to iterate over
-- @param scope The settings scope, e.g. autocmds
functions.load_custom_settings = function(settings_tbl, scope)
    -- If the provided settings table is not empty
    if next(settings_tbl) ~= nil then
        log.debug("Loading custom " .. scope .. " ...")
        if scope == "functions" then
            for _, func in ipairs(settings_tbl) do
                -- Copy the function table so we can modify it safely
                local func_tbl = func
                -- Remove the additional table parameters
                func_tbl.run_on_start = nil
                local func_name = vim.tbl_keys(func_tbl)[1]

                -- If we should run the function on launch or set it as a global function
                if func.run_on_start then
                    func_tbl[func_name]()
                else
                    _G[func_name] = func_tbl[func_name]
                end
            end
        elseif scope == "mappings" then
            for _, map in ipairs(settings_tbl) do
                -- scope, lhs, rhs, options
                vim.api.nvim_set_keymap(map[1], map[2], map[3], map[4] and map[4] or {})
            end
        elseif scope == "autocmds" then
            utils.create_augroups(settings_tbl)
        elseif scope == "commands" then
            for _, cmd in ipairs(settings_tbl) do
                vim.cmd(cmd)
            end
        elseif scope == "variables" then
            for var, val in pairs(settings_tbl) do
                vim.g[var] = val
            end
        elseif scope == "options" then
            for var, val in pairs(settings_tbl) do
                vim.opt[var] = val
            end
        end
    end
end

-- Quit Neovim and change the colorscheme at pato_config.lua if the colorscheme is not the same,
-- dump all messages to pato.log file
-- @tparam bool write If pato should save before exiting
-- @tparam bool force If pato should force the exiting
functions.quit_pato = function(write, force)
    -- functions.change_colors_and_bg()

    local quit_cmd = ""
    if write then
        quit_cmd = "wa | "
    end
    if force then
        vim.cmd(quit_cmd .. "qa!")
    else
        vim.cmd(quit_cmd .. "q!")
    end
end

-- Check for plugins updates
functions.check_updates = function()
    local updated_plugins, err = xpcall(function()
        log.info("Updating the outdated plugins ...")
        vim.cmd("PackerSync")
    end, debug.traceback)

    if not updated_plugins then
        log.error("Unable to update plugins. Traceback:\n" .. err)
    end
end


-- -- update_pato saves the current commit/release hash into a file for future
-- -- restore if needed and then updates Pato.
-- functions.update_pato = function()
--  save_backup_hashes()

--  log.info("Pulling Pato remote changes ...")

--  local updater = async:new({
--  cmd = "git pull",
--  cwd = system.pato_root,
--  on_stdout = function(_, data)
--      if data then
--          log.info("Successfully updated Pato!")
--          --- Completely reload Pato Nvim
--          require("pato.modules.built-in.reloader").full_reload()
--      end
--  end,
--  on_stderr = function(err, data)
--      if err then
--          log.error("Error while updating Pato. Traceback:\n" .. err)
--          elseif data then
--          log.error("Error while updating Pato. Traceback:\n" .. data:gsub("[\r\n]", ""))
--      end
--  end,
--  })
--  updater:start()
-- end

-- change_number() -- <leader>tn -- change the number display modes
functions.change_number = function()
    local number = vim.o.number
    local relativenumber = vim.o.relativenumber
    if (number == false) and (relativenumber == false) then
        vim.o.number = true
        vim.o.relativenumber = false
        print("number on, relativenumber off")
    elseif (number == true) and (relativenumber == false) then
        vim.o.number = false
        vim.o.relativenumber = true
        print("number off, relativenumber on")
    elseif (number == false) and (relativenumber == true) then
        vim.o.number = true
        vim.o.relativenumber = true
        print("number on, relativenumber on")
    else -- (number == true) and (relativenumber == true) then
        vim.o.number = false
        vim.o.relativenumber = false
        print("number off, relativenumber off")
    end
end

return functions