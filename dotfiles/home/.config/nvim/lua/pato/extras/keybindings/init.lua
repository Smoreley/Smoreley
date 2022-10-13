
local log = require("pato.extras.logging")
local config = require("pato.core.config").config

log.debug("Loading pato keybindings module ...")

---[[---------------------------------]]---
--          Custom Key mappings          --
--                                       --
--    <leader>b = +buffers               --
--    <leader>c = +code                  --
--    <leader>d = +debug                 --
--    <leader>l = +lsp                   --
--    <leader>f = +file                  --
--    <leader>g = +git                   --
--    <leader>p = +plugins               --
--    <leader>q = +quit/sessions         --
--    <leader>s = +search                --
--    <leader>w = +windows               --
--    <leader>o = +open                  --
--                                       --
--           F2 = Toggle Symbols-Outline --
--           F3 = Toggle Tree Explorer   --
---]]---------------------------------[[---

local keybinds_modules = config.pato.keybinds_modules
    or {
        -- Core pato keybindings
        core = true,
        -- Movement keybindings, jump between your windows, buffers and code
        movement = true,
        -- Leader keybindings, a bunch of useful keybindings managed by space key
        -- WARNING: disabling this will break which-key plugin if the plugin is enabled
        leader = true,
        -- Completion and snippets keybindings
        completion = true,
    }

for module in pairs(keybinds_modules) do
    if keybinds_modules[module] then
        local ok, err = xpcall(require, debug.traceback, ("pato.extras.keybindings.%s"):format(module))
        if not ok then
            log.error(
                string.format(
                    "There was an error loading the module 'pato.extras.keybindings.%s'. Traceback:\n%s",
                    module,
                    err
                )
            )
        end
    end
end