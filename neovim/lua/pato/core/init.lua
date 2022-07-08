-- Main configuration file
-- Loads all the core components

local log = require("pato.extras.logging")

log.debug("Loading Pato core ...")

local core_modules = { "settings", "settings.netrw", "config.ui", "config" }
for i = 1, #core_modules, 1 do
    local ok, err = xpcall(require, debug.traceback, ("pato.core.%s"):format(core_modules[i]))
    if ok then
        if core_modules[i] == "settings" then
            -- Neovim configurations, e.g. shiftwidth
            require("pato.core.settings").load_default_options()
            -- User-defined settings (global variables, mappings, etc)
            require("pato.core.settings").custom_options()
            -- pato Nvim custom commands
            require("pato.core.settings").pato_commands()
        end
        log.debug(string.format("Successfully loaded 'pato.core.%s' module", core_modules[i]))
    else
        log.error(
            string.format(
                "There was an error loading the module 'pato.core.%s'. Traceback:\n%s",
                core_modules[i],
                err
            )
        )
    end
end