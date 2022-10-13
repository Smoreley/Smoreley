
local mappings = require("pato.utils.mappings")
local config = require("pato.core.config").config
local is_plugin_disabled = require("pato.utils").is_plugin_disabled

-- Additional options for mappings
local opts = { silent = true }

-- Fast exit from Doom Nvim
mappings.map(
    "n",
    "ZZ",
    '<cmd>lua require("pato.core.functions").quit_pato(true, true)<CR>',
    opts,
    "Editor",
    "fast_exit",
    "Fast exit from pato Nvim"
)

-- Disable accidentally pressing ctrl-z and suspending
mappings.map("n", "<c-z>", "<Nop>", opts, "Editor", "disable_suspending", "Disable suspending")

-- Disable ex mode
mappings.map("n", "Q", "<Nop>", opts, "Editor", "disable_ex", "Disable ex mode")

-- Disable recording macros
if config.pato.disable_macros then
    mappings.map("n", "q", "<Nop>", opts, "Editor", "disable_macros", "Disable macros")
end

-- Symbols
if not is_plugin_disabled("symbols") then
    mappings.map("n", "<F2>", ":SymbolsOutline<CR>",
        opts, "Editor", "open_symbols", "Toggle SymbolsOutline (LSP tags)")
end

-- Tree
if not is_plugin_disabled("explorer") then
    mappings.map("n", "<F3>", ":NvimTreeToggle<CR>",
        opts, "Editor", "open_tree", "Toggle file explorer")
end

-- Trouble
if not is_plugin_disabled("trouble") then
    mappings.map("n", "<F4>", ":TroubleToggle<CR>", opts, "Editor", "open_trouble", "Toggle Trouble")
end

-- Zen
if not is_plugin_disabled("zen") then
    -- mappings.map("n", "<F11>", ":TZAtaraxis<CR>", opts, "Editor", "open_zen", "Toggle Zen mode")
    mappings.map("n", "<F11>", ":TZFocus<CR>", opts, "Editor", "open_zen", "Toggle Zen mode")
end