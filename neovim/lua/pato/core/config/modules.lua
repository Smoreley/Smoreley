local system = require("pato.core.system")
local log = require("pato.extras.logging")

log.debug("Loading Pato modules module ...")

local modules = {}

modules.modules = {
    ui = {
        "dashboard",             -- Start screen
        -- "pato-themes",           -- Additional pato emacs' colorschemes
        "indentlines",           -- Show indent lines
        -- "show_registers",        -- popup that shows register contents
        "statusline",            -- Statusline
        "tabline",               -- Tabline, shows your buffers list at top
        "which-key",             -- Keybindings popup menu like Emacs' guide-key
        "zen",                   -- Distraction free environment
        -- "illuminated",           -- Highlight other uses of the word under the cursor like VSC
    },
    pato = {
        -- "neorg",                -- Life Organization Tool
    },
    editor = {
        "autopairs",            -- Autopairs
        "auto-session",         -- A small automated session manager for Neovim
        "dap",                  -- Debug Adapter Protocol
        -- "editorconfig",         -- EditorConfig support for Neovim
        "explorer",             -- Tree explorer
        "formatter",            -- File formatting
        "gitsigns",             -- Git signs
        "kommentary",           -- Comments plugin
        "linter",               -- Asynchronous linter, see errors in your code on the fly
        "lsp",                  -- Language Server Protocols
        -- "minimap",              -- Code minimap, requires github.com/wfxr/code-minimap
        -- "ranger",               -- Ranger File Browser, requires ranger file browser
        "snippets",             -- Code snippets
        -- "symbols",              -- LSP symbols and tags
        "telescope",            -- Highly extendable fuzzy finder over lists
        "terminal",             -- Terminal for Neovim (NOTE: needed for runner and compiler)
        "trouble",              -- A pretty list to help you solve all the trouble your code is causing.
    },
    langs = {
        "css",                  -- CSS support
        "html",                 -- HTML support
        "javascript",           -- JavaScript support
        "typescript",           -- TypeScript support

        "bash",
        "elixir",

        "lua",
        "python +lsp",          -- Python support + lsp
        "rust +lsp",            -- Rust support
        "cpp",                  -- C++ support

        "markdown",
        "config",               -- Configuration files (JSON, YAML, TOML)
        "dockerfile",
    },
    utilities = {
    },
    web = {
    },
}

modules.source = nil

return modules