-- https://github.com/nvim-treesitter/nvim-treesitter
return function()
    local has_value = require("pato.utils").has_value
    local modules = require("pato.core.config.modules").modules
    local is_plugin_disabled = require("pato.utils").is_plugin_disabled

    -- Returns treesitter parsers from pato_modules.langs
    local function get_ts_parsers(languages)
        local langs = {}
        for _, lang in ipairs(languages) do
            -- if the lang is config then add parsers for JSON, YAML, and TOML
            if lang == "config" then
                table.insert(langs, "json")
                table.insert(langs, "yaml")
                table.insert(langs, "toml")
            else
                lang = lang:gsub("%s+%+lsp(%(%a+%))", ""):gsub("%s+%+lsp", ""):gsub("%s+%+debug", "")
                table.insert(langs, lang)
            end
        end
        return langs
    end

    -- Set up treesitter for Neorg
    if packer_plugins and packer_plugins["neorg"] then
        table.insert(modules.langs, "norg")
    end

    if packer_plugins and packer_plugins["rest.nvim"] then
        table.insert(modules.langs, "http")
    end

    require("nvim-treesitter.configs").setup({
        ensure_installed = get_ts_parsers(modules.langs),
        highlight = {enable = true},
        indent = {enable=true},
        -- playground = { enable = true },
        tree_docs = { enable = true },
        -- context_commentstring = { enable = true },
    })
end