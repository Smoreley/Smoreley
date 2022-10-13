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
        module_pattern = "aniseed",
    })

    -- Sessions
    use({
        "folke/persistence.nvim",
        commit = pin_commit("77cf5a6ee162013b97237ff25450080401849f85"),
        config = require("pato.modules.configs.persistence"),
    })

    -- Dashboard
    use({
        "glepnir/dashboard-nvim",
        config = require("pato.modules.configs.dashboard"),
    })

    -- ColorSchemes
    use({
        -- "shaunsingh/nord.nvim",
        -- "EdenEast/nightfox.nvim",
        "folke/tokyonight.nvim",
        -- "rebelot/kanagawa.nvim",
        -- "shaunsingh/moonlight.nvim",
        -- "phanviet/vim-monokai-pro",
        -- "ray-x/starry.nvim",
        config = function()
            -- vim.g.nord_borders = true
            -- require('nord').set()
        end
    })

    -- Development icons
    use({
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons",
        config = require("pato.modules.configs.devicons"),
    })

    -- FileTree (nvim-tree)
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

    -- Broot
    -- use({
    --     "skyuplam/broot.nvim",
    -- })
    -- use({
    --     "rbgrouleff/bclose.vim",
    -- })

    -- Statusline
    use({
        "NTBBloodbath/galaxyline.nvim",
        config = require("pato.modules.configs.galaxyline"),
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })

    -- Terminal (Better terminal)
    use({
        "akinsho/toggleterm.nvim",
        config = require("pato.modules.configs.toggleterm"),
        module = { "toggleterm", "toggleterm.terminal" },
        cmd = { "ToggleTerm", "TermExec" },
        keys = { "n", "<F5>" },
    })

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

    -- popup that shows contents of each register
    -- use({
    --     "tversteeg/registers.nvim",
    -- })

    -- Distraction free environment
    use({
        "Pocco81/true-zen.nvim",
        config = require("pato.modules.configs.zen"),
        module = "true_zen",
        event = "BufWinEnter",
    })

    -- Highlight other uses of the word under the cursor like VSC
    use({
        "RRethy/vim-illuminate",
        setup = function()
            vim.g.Illuminate_ftblacklist = {
                "help",
                "dashboard",
                "packer",
                "norg",
                "PatoInfo",
                "NvimTree",
                "Outline",
                "toggleterm",
            }
        end,
        event = "BufRead",
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
        commit = pin_commit("0011b1148d3975600f5a9f0be8058cdaac4e30d9"),
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

    -- Git gutter
    use({
        "lewis6991/gitsigns.nvim",
        config = require("pato.modules.configs.gitsigns"),
        requires = "plenary.nvim",
        event = "BufRead",
    })

    -- LazyGit integration
    use({
        "kdheepak/lazygit.nvim",
        requires = "plenary.nvim",
        cmd = { "LazyGit", "LazyGitConfig" },
    })

    -- Built-in LSP Config
    use({
        "neovim/nvim-lspconfig",
        config = require("pato.modules.configs.lsp").config,
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
        "hrsh7th/cmp-nvim-lua",
        after = "nvim-cmp",
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

    -- -- Rust
    -- use({
    --     "simrat39/rust-tools.nvim",
    --     config = require("pato.modules.configs.rusttools"),
    --     cmd = { "RustSetInlayHints" },
    -- })

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

    use({
        "rcarriga/nvim-dap-ui",
        config = require("pato.modules.configs.dap").ui,
        after = "nvim-dap",
    })

    -- Manage debuggers provided by nvim-dap
    -- use({
    --     "Pocco81/dap-buddy.nvim",
    --     config = require("pato.modules.configs.dap").install,
    --     after = "nvim-dap",
    -- })

    -- File formatting
    -- use({
    --     "lukas-reineke/format.nvim",
    --     config = require("pato.modules.configs.format"),
    --     cmd = { "Format", "FormatWrite" },
    -- })

    -- Indent Lines
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = require("pato.modules.configs.blankline"),
        event = "ColorScheme",
    })

    -- Whitespace
    -- use "ntpeters/vim-better-whitespace"
    -- use{
    --     "ntpeters/vim-better-whitespace",
    --     config = function()
    --         vim.g.better_whitespace_filetypes_blacklist = {'dashboard'}
    --         vim.g.better_whitespace_enabled = 1
    --         vim.g.strip_whitespace_on_save = 1
    --         vim.g.strip_whitespace_confirm = 0
    --         -- vim.g.better_whitespace_ctermcolor='green'
    --         -- vim.g.better_whitespace_guicolor='#0f0f0f'
    --         vim.cmd("EnableStripWhitespaceOnSave")
    --     end,
    --     -- event = "BufWritePre",
    -- }

    -- Comments
    -- use({
    --     "b3nj5m1n/kommentary",
    --     event = "BufWinEnter",
    -- })

    -- Colorizer
    use({
        "norcalli/nvim-colorizer.lua",
        config = require("pato.modules.configs.colorizer"),
        event = "ColorScheme",
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