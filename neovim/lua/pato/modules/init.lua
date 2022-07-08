
local is_plugin_disabled = require("pato.utils").is_plugin_disabled
local use_floating_win_packer = require("pato.core.config").config.pato.use_floating_win_packer

-- Freeze dependencies and helper function for clean code
local freeze_dependencies = require("pato.core.config").config.pato.freeze_dependencies
local pin_commit = function(commit_sha)
    return freeze_dependencies and commit_sha or nil
end

-- Packer
local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    require("pato.extras.logging").info("Bootstrapping packer.nvim, please wait ...")
    vim.fn.system({
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        packer_path,
    })
end

-- Load packer
vim.cmd([["packadd packer.nvim"]])
local packer = require("packer")

-- Change some Packer defaults
packer.init({
    git = {
        clone_timeout = 300,
        subcommands = {
            install = "clone --depth %i --progress",
        }
    },
    display = {
        open_fn = use_floating_win_packer and function()
            return require("packer.util").float({border="single"})
        end or nil,
    },
    profile = {
        enable = true,
    },
})

-- Run Packer
packer.startup(function(use)
    -- Plugins manager
    use({
        "wbthomason/packer.nvim",
        opt = true,
    })

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        opt = true,
        run = ":TSUpdate",
        config = require("pato.modules.configs.treesitter"),
    })
    use({
        "JoosepAlviste/nvim-ts-context-commentstring",
        after = "nvim-treesitter",
    })
    use({
        "nvim-treesitter/nvim-tree-docs",
        after = "nvim-treesitter",
    })
    use({
        "windwp/nvim-ts-autotag",
        after = "nvim-treesitter",
    })

    -- Aniseed, required by some treesitter modules
    use({
        "Olical/aniseed",
        commit = pin_commit("7968693e841ea9d2b4809e23e8ec5c561854b6d6"),
        module_pattern = "aniseed",
    })

    -- Dashboard
    use({
        "glepnir/dashboard-nvim",
        config = require("pato.modules.configs.dashboard"),
    })

    use({
        -- "shaunsingh/nord.nvim",
        "EdenEast/nightfox.nvim",
        -- "folke/tokyonight.nvim",
    })

    -- Development icons
    use({
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons",
        config = require("pato.modules.configs.devicons"),
    })

    -- FileTree
    use({
        "kyazdani42/nvim-tree.lua",
        requires = "nvim-web-devicons",
        config = require("pato.modules.configs.tree"),
        cmd = {
            "NvimTreeClipboard",
            "NvimTreeClose",
            "NvimTreeFindFile",
            "NvimTreeOpen",
            "NvimTreeRefresh",
            "NvimTreeToggle",
        },
    })

    -- Statusline
    use({
        "NTBBloodbath/galaxyline.nvim",
        config = require("pato.modules.configs.galaxyline"),
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })

    -- Tabline
    use({
        "akinsho/bufferline.nvim",
        config = require("pato.modules.configs.bufferline"),
        event = "BufWinEnter",
    })

    -- Terminal

    -- Viewer & finder for LSP symbols and tags
    use({
        "simrat39/symbols-outline.nvim",
        config = require("pato.modules.configs.symbols"),
        cmd = {
            "SymbolsOutline",
            "SymbolsOutlineOpen",
            "SymbolsOutlineClose",
        },
    })

    -- Keybindings menu like Emacs's guide-key
    use({
        "folke/which-key.nvim",
        opt = true,
        config = require("pato.modules.configs.whichkey"),
    })

    -- Distraction free environment
    use({
        "Pocco81/TrueZen.nvim",
        config = require("pato.modules.configs.zen"),
        module = "true-zen",
        event = "BufWinEnter",
    })

    -- Fuzzy Search
    use({
        "nvim-lua/plenary.nvim",
        module = "plenary",
    })
    use({
        "nvim-lua/popup.nvim",
        module = "popup",
    })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        module = "telescope",
        requires = {
            "popup.nvim",
            "plenary.nvim",
        },
        config = require("pato.modules.configs.telescope"),
    })
    use({
        "lazytanuki/nvim-mapper",
        config = function()
            local pato_root, sep = require("pato.core.system").pato_root, require("pato.core.system").sep
            require("nvim-mapper").setup({
                -- do not assign the default keymap (<leader>MM)
                no_map = true,
                -- where should ripgrep look for your keybinds definitions.
                -- Default config search path is ~/.config/nvim/lua
                search_path = string.format("%s%slua", pato_root, sep),
                -- what should be done with the selected keybind when pressing enter.
                -- Available actions:
                --   * "definition" - Go to keybind definition (default)
                --   * "execute" - Execute the keybind command
                action_on_enter = "execute",
            })
        end,
    })

    -- Setup for Lua development in Neovim
    use({
        "folke/lua-dev.nvim",
        module = "lua-dev",
    })

    -- Debugging
    use({
        "mfussenegger/nvim-dap",
        event = "BufWinEnter",
    })

    -- Indent Lines
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = require("pato.modules.configs.blankline"),
        event = "ColorScheme",
    })

  -- Built-in LSP Config
    use({
        "neovim/nvim-lspconfig",
        config = require("pato.modules.configs.lsp").config,
        disable = disabled_lsp,
    })

    -- Completion plugin
    use({
        "hrsh7th/nvim-cmp",
        wants = { "LuaSnip" },
        requires = {
            {
                "L3MON4D3/LuaSnip",
                event = "BufReadPre",
                wants = "friendly-snippets",
                config = require("pato.modules.configs.luasnip"),
                requires = { "rafamadriz/friendly-snippets" },
            },
            {
                "windwp/nvim-autopairs",
                config = require("pato.modules.configs.autopairs"),
                event = "BufReadPre",
            },
        },
        config = require("pato.modules.configs.cmp"),
        disable = disabled_lsp,
        event = "InsertEnter",
    })
    use({
        "hrsh7th/cmp-nvim-lsp",
        after = "nvim-cmp",
    })
    use({
        "hrsh7th/cmp-path",
        after = "nvim-cmp",
    })
      use({
        "hrsh7th/cmp-buffer",
        after = "nvim-cmp",
    })
    use({
        "saadparwaiz1/cmp_luasnip",
        after = "nvim-cmp",
    })

    -- Manage Language servers with ease.
    use({
        "williamboman/nvim-lsp-installer",
        config = require("pato.modules.configs.lsp").installer,
    })

    -- Show function signature when you type
    use({
        "ray-x/lsp_signature.nvim",
        config = require("pato.modules.configs.lsp").signature,
        after = "nvim-lspconfig",
        event = "InsertEnter",
    })

    -- -- highlight and search for todo comments
    -- use({
    --     "folke/todo-comments.nvim",
    --     requires = "nvim-lua/plenary.nvim",
    --     config = require("pato.modules.configs.todo"),
    --     -- event = "ColorScheme",
    -- })

    -- A pretty list for showing diagnostics,
    use({
        "folke/trouble.nvim",
        cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
        requires = "kyazdani42/nvim-web-devicons",
        config = require("pato.modules.configs.trouble"),
    })

    -- UI for nvim-lsp progress
    use({
        "j-hui/fidget.nvim",
        config = require("pato.modules.configs.fidget"),
    })

end)