-- Store startup time in seconds
vim.g.start_time = vim.fn.reltime()

local load_modules = require("pato.utils.modules").load_modules

-- Disable some unused built-in Neovim plugins
vim.g.loaded_gzip = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_2html_plugin = false

-- Pato Configuration
-- Load core and UI related stuff
load_modules("pato", {"core"})

-- Defer and schedule loading of plugins and extra functionalities until
-- Neovim API functions are safe to call to avoid weird errors with plugins
vim.defer_fn(function()
    -- Load extra stuff and plugins
    load_modules("pato", {"modules", "extras"})

    -- This loads certain plugins related to UI
    vim.cmd("doautocmd ColorScheme")

    -- If the current buffer name is empty then trigger Dashboard.
    if (packer_plugins and packer_plugins["dashboard-nvim"])
        and (vim.api.nvim_buf_get_number(0) > 1 or vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]:len() == 0)
        and vim.api.nvim_buf_get_name(0):len() == 0 -- Empty buffer name
    then
        vim.cmd("Dashboard")
    end

    vim.cmd([[
        PackerLoad nvim-treesitter
        " This BufEnter call should fix some issues with concealing in neorg
        doautocmd BufEnter
    ]])

    if not require("pato.utils").is_plugin_disabled("which-key") then
        vim.cmd([[
            PackerLoad which-key.nvim
        ]])
    end
end, 0)
