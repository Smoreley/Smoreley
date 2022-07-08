
local mappings = require("pato.utils.mappings")
local config = require("pato.core.config").config
local is_plugin_disabled = require("pato.utils").is_plugin_disabled

-- Additional options for mappings
local opts = { silent = true }

-- Fast exit from Doom Nvim
-- mappings.map(
--     "n",
--     "ZZ",
--     '<cmd>lua require("pato.core.functions").quit_pato(true, true)<CR>',
--     opts,
--     "Editor",
--     "fast_exit",
--     "Fast exit from pato Nvim"
-- )

-- Disable recording macros
if config.pato.disable_macros then
    mappings.map("n", "q", "<Nop>", opts, "Editor", "disable_macros", "Disable macros")
end

local mod_utils = require("pato.utils.modules")
-- if mod_utils.is_module_available("explorer") then
-- if mod_utils.is_module_available("nvim-tree") then
    -- if not is_plugin_disabled("explorer") and not config.doom.use_netrw then
    mappings.map(
        "n",
        "<F3>",
        ":NvimTreeToggle<CR>",
        opts,
        "Editor",
        "open_tree",
        "Toggle file explorer"
    )
-- else
--     mappings.map(
--         "n",
--         "<F3>",
--         string.format(":Lexplore%s<CR>", config.pato.explorer_right and "!" or ""),
--         opts,
--         "Editor",
--         "open_tree",
--         "Toggle file explorer"
--     )
-- end

-- Zen
if not is_plugin_disabled("zen") then
    mappings.map("n", "<F11>", ":TZAtaraxis<CR>", opts, "Editor", "open_zen", "Toggle Zen mode")
end

-- Trouble
if not is_plugin_disabled("trouble") then
    mappings.map("n", "<F4>", ":TroubleToggle<CR>", opts, "Editor", "open_trouble", "Toggle Trouble")
end