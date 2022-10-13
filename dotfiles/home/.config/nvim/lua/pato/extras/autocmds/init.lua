local utils = require("pato.utils")
local log = require("pato.extras.logging")
local config = require("pato.core.config").config
local is_plugin_disabled = require("pato.utils").is_plugin_disabled

log.debug("Loading Pato autocmds module ...")

local autocmds = {
    pato_core = {
        -- -- Compile new plugins configurations changes at save
        -- {
        --     "BufWritePost",
        --     "*/config/pato-*.lua",
        --     "PackerCompile profile=true",
        -- },

    -- -- Compile modules and custom plugins changes at exit, in that way we avoid
    -- -- weird errors of Packer complaining about uninstalled plugins on startup
    -- {
    --   "VimLeavePre",
    --   "pato_modules.lua,pato_userplugins.lua",
    --   "PackerCompile profile=true",
    -- },
    -- Live-reload plugins and automatically install or clean them at save
    -- {
    --   "BufWritePost",
    --   "pato_modules.lua,pato_userplugins.lua",
    --   "lua require('pato.modules.built-in.reloader').reload_plugins_definitions()",
    -- },
    -- -- Live-reload user-defined settings when 'pato_config.lua' file was modified
    -- {
    --   "BufWritePost",
    --   "pato_config.lua",
    --   "lua require('pato.core.functions').reload_custom_settings()",
    -- },
    -- -- Live-reload plugins configuration files
    -- {
    --   "BufWritePost",
    --   "*/config/pato-*.lua",
    --   "lua require('pato.modules.built-in.reloader').reload_lua_module(vim.fn.expand('%:p'))",
    -- },
        -- -- Automatically change colorscheme and background on exit
        -- {
        --     "VimLeavePre",
        --     "*",
        --     "lua require('pato.core.functions').change_colors_and_bg()",
        -- },
    },
    pato_extras = {
        { "User", "TelescopePreviewerLoaded", "setlocal wrap" },
    },
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

-- Set autosave
if config.pato.autosave then
    table.insert(autocmds["pato_core"], {
        "TextChanged,InsertLeave",
        "<buffer>",
        "silent! write",
    })
end

-- Enable auto comment
if not config.pato.auto_comment then
    vim.opt.formatoptions:remove({ "c", "r", "o" })
end

-- Enable highlight on yank
if config.pato.highlight_yank then
    table.insert(autocmds["pato_core"], {
        {
        "TextYankPost",
        "*",
        "lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})",
        },
    })
end

-- Format on save
-- NOTE: Requires formatter to be enabled!
if config.pato.fmt_on_save then
    table.insert(autocmds["pato_core"], {
        "BufWritePre",
        "*",
        "FormatWrite",
    })
end

-- Remove Line-numbers from terminal
table.insert(autocmds["pato_core"], {
    "TermOpen * setlocal nonumber norelativenumber"
})

-- Quickly exit Neovim on dashboard
if not is_plugin_disabled("dashboard") then
    table.insert(autocmds["pato_extras"], {
        "FileType",
        "dashboard",
        "nnoremap <silent> <buffer> q :q<CR>",
    })
end

-- Show line diagnostics on hover
if not config.pato.enable_lsp_virtual_text then
    table.insert(autocmds["pato_extras"], {
        "CursorHold,CursorHoldI",
        "<buffer>",
        "lua vim.diagnostic.open_float(nil, { focus = false })",
    })
end

-- Create augroups
utils.create_augroups(autocmds)