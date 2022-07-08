local lsp = {}

lsp.config = function()
    local fn = vim.fn
    local lsp = vim.lsp
    local config = require("pato.core.config").config

    -- Lsp Symbols
    local signs, hl
    signs = {
        Error = config.pato.lsp_error,
        Warning = config.pato.lsp_warn,
        Information = config.pato.lsp_info,
        Hint = config.pato.lsp_hint,
    }
    hl = "LspDiagnosticsSign"

    for severity, icon in pairs(signs) do
        local highlight = hl .. severity

        fn.sign_define(highlight, {
            text = icon,
            texthl = highlight,
            numhl = highlight,
        })
    end

    lsp.handlers["textDocument/publishDiagnostics"] =
        lsp.with(lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = config.pato.enable_lsp_virtual_text and {
            prefix = config.pato.lsp_virtual_text, -- change this to whatever you want your diagnostic icons to be
        } or false,
    })
    -- Border for lsp_popups
    lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
    })
    lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
    })

    -- suppress error messages from lang servers
    vim.notify = function(msg, log_level, _opts)
        if msg:match("exit code") then
            return
        end
        if log_level == vim.log.levels.ERROR then
            vim.api.nvim_err_writeln(msg)
        else
            vim.api.nvim_echo({ { msg } }, true, {})
        end
    end
end

lsp.installer = function()
    local log = require("pato.extras.logging")
    local utils = require("pato.utils")
    local is_plugin_disabled = require("pato.utils").is_plugin_disabled

    local servers = {
        lua = { "sumneko_lua" },
        c = { "clangd" },
        cpp = { "clangd" },
        dockerfile = { "dockerls" },
        go = { "gopls" },
        html = { "html" },
        json = { "jsonls" },
        javascript = { "tsserver" },
        php = { "phpactor" },
        python = { "pyright" },
        rust = { "rust_analyzer" },
        xml = { "lemminx" },
        yaml = { "yamlls" },
    }

    -- Snippets support
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local lua_lsp = require("lua-dev").setup({
        lspconfig = {
            settings = {
                Lua = {
                    workspace = {
                        preloadFileSize = 200,
                    },
                    diagnostics = {
                        globals = { "packer_plugins" },
                    },
                },
            },
            capabilities = capabilities,
            on_attach = on_attach,
        },
    })

    -- Load langs from pato, install servers with +lsp flag and sets up their config
    local function setup_servers()
        local lsp_installer = require("nvim-lsp-installer")

        local modules = require("pato.core.config.modules").modules
        local langs = modules.langs

        -- Find all LSPs that need to be installed
        local ensure_installed = {}
        for _, lang in ipairs(langs) do
            -- Lang name used for key in servers table
            local lang_name = lang
            :gsub("%s+%+lsp(%(%a+%))", "")
            :gsub("%s+%+lsp", "")
            :gsub("%s+%+debug", "")
            -- Get LSP override +lsp(<override>) if it exists
            local lsp_override = lang:match("+lsp%((.+)%)")
            -- Array of lsps to ensure are installed
            local lang_lsps = lsp_override ~= nil and vim.split(lsp_override, ",")
            or servers[lang_name] ~= nil and servers[lang_name]
            or nil

            local should_install_lsp = lang:find("+lsp")

            -- Save all lsps to ensure_installed
            if should_install_lsp then
                if lang_lsps ~= nil then
                    for _, lsp_name in ipairs(lang_lsps) do
                        local trimmed_lsp_name = vim.trim(lsp_name)
                        if utils.has_value(ensure_installed, trimmed_lsp_name) == false then
                            table.insert(ensure_installed, trimmed_lsp_name)
                        end
                    end
                else
                    if lang:find("scala") then
                        -- Enable setup for Scala Metals LSP
                        should_setup_scala_lsp = true
                    else
                        log.error(
                        'The language "' .. lang .. '" does not have an LSP, please remove the "+lsp" flag.'
                        )
                    end
                end
            end
        end

        -- Flatten the array of default servers.
        -- Default servers will be automatically uninstalled if no +lsp flag is provided.
        local default_servers = {}
        for _, lang_servers in pairs(servers) do
            for _, lsp_name in ipairs(lang_servers) do
                if not utils.has_value(default_servers, lsp_name) then
                    table.insert(default_servers, lsp_name)
                end
            end
        end
        -- Save which servers were installed/uninstalled so this info can be presented to user
        local installing_servers = {}
        local uninstalling_servers = {}
        -- Install all LSPs that should be installed
        for _, lsp_name in ipairs(default_servers) do
            local ok, server = lsp_installer.get_server(lsp_name)
            if ok then
                if not utils.has_value(ensure_installed, lsp_name) then
                    if server:is_installed() then
                        table.insert(uninstalling_servers, lsp_name)
                        server:uninstall()
                        log.info("pato-lsp-installer: Uninstalling server " .. lsp_name .. ".")
                    end
                else
                    local server_config = server.name == "sumneko_lua" and lua_lsp or {
                        capabilities = capabilities,
                        on_attach = on_attach,
                    }
                    -- Setup server once it's ready
                    server:on_ready(function()
                    server:setup(server_config)
                    end)
                    if not server:is_installed() then
                        table.insert(installing_servers, lsp_name)
                        server:install()
                        log.info("pato-lsp-installer: Installing server " .. lsp_name .. ".")
                    end
                end
            end
        end

        -- Install and setup non-default LSPs
        for _, lsp_name in ipairs(ensure_installed) do
            if not utils.has_value(default_servers, lsp_name) then
                local ok, server = lsp_installer.get_server(lsp_name)

                if ok then
                    server:on_ready(function()
                        server:setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                        })
                    end)
                    if not server:is_installed() then
                        table.insert(installing_servers, lsp_name)
                        server:install()
                        log.info("pato-lsp-installer: Installing server " .. lsp_name .. ".")
                    end
                end
            end
        end

        -- -- Setup Scala Metals LSP
        -- if should_setup_scala_lsp then
        --     require("lspconfig").metals.setup({
        --         capabilities = capabilities,
        --         on_attach = on_attach,
        --     })
        -- end

        -- Print intalling/uninstalling information to user on startup
        if next(installing_servers) ~= nil or next(uninstalling_servers) ~= nil then
            local msg = "Pato: "
            local installing_count = #installing_servers
            if installing_count > 0 then
                msg = msg .. "Installing " .. installing_count .. " LSPs.  "
            end
            local uninstalling_count = #uninstalling_servers
            if uninstalling_count > 0 then
                msg = msg .. "Uninstalling " .. installing_count .. " LSPs.  "
            end
            msg = msg .. "Use :LspInstallInfo to check status.  "
            vim.notify(msg)
        end
    end

    -- Defer auto install to unblock startup
    vim.defer_fn(function()
        setup_servers()
    end, 50)
end

lsp.signature = function()
    -- Signature help
    local cfg = {
        bind = true,
        doc_lines = 10,
        floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
        floating_window_above_cur_line = true,
        fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
        hint_enable = true, -- virtual hint enable
        -- hint_prefix = "🐼 ", -- Panda for parameter
        hint_prefix = " ",
        hint_scheme = "String",
        -- use_lspsaga = false, -- set to true if you want to use lspsaga popup
        hi_parameter = "Search", -- how your parameter will be highlight
        max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
        -- to view the hiding contents
        max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
        handler_opts = {
            border = "single", -- double, single, shadow, none
        },
        -- transpancy = 80,
        extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
        zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
        debug = false, -- set to true to enable debug logging
        log_path = "debug_log_file_path", -- debug log path
        padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
        shadow_blend = 36, -- if you using shadow as border use this set the opacity
        shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
    }
    require("lsp_signature").setup(cfg)
end

return lsp