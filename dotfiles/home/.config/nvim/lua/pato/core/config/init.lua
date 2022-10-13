local config = {}

local log = require("pato.extras.logging")
local system = require("pato.core.system")

log.debug("Loading Pato config module ...")

-- Check if running Neovim or Vim and fails if:
-- 1. Running Vim instead of Neovim
-- 2. Running Neovim 0.4 or below
if vim.fn.has("nvim") == 1 then
    if vim.fn.has("nvim-0.6") ~= 1 then
        log.fatal("Pato Nvim requires Neovim 0.6.0, please update it")
    end
else
    log.fatal("Pato Nvim does not have support for Vim, please use it with Neovim instead")
end

-- Set termguicolors on load
if vim.fn.has("vim_starting") then
    vim.opt.termguicolors = true
end

config.config = {
    pato = {
        freeze_dependencies = true,

        -- Autosave
        -- false : Disable autosave
        -- true  : Enable autosave
        -- @default = false
        autosave = false,

        -- Format on save
        -- false : Disable format on save
        -- true  : Enable format on save
        -- @default = false
        fmt_on_save = false,

        -- Disable Vim macros
        -- false : Enable Vim macros
        -- true  : Disable Vim macros
        -- @default = false
        disable_macros = false,

        -- Autosave sessions
        -- false : Disable session autosave
        -- true  : Enable session autosave
        -- @default = false
        autosave_sessions = false,

        -- Autoload sessions
        -- false : Disable session autoload
        -- true  : Enable session autoload
        -- @default = false
        autoload_last_session = false,

        -- Enable Swap files
        -- false : no swap files
        -- true  : enables swap files
        -- @default = false
        swap_files = false,

        -- Undo Directories
        -- the backup variable enables backup related settings (undofile, undodir)
        -- false : ignores undo Directories (this code block will be ignored)
        -- true  : enable undo files/undo dirs.
        -- @default = false
        -- WARNING: if you change this to false and you have an undo dir already,
        --          it will REMOVE the undodir (loss of data might take place)
        backup = false,

        -- Enable Line wrapping
        -- false : disables line wrapping
        -- true  : enables line wrapping
        -- @default = false
        line_wrap = true,

        -- Enable Show mode ( -- INSERT --, -- NORMAL --, -- VISUAL -- )
        -- false : disables show mode
        -- true  : enables show mode
        -- @default = false
        show_mode = false,

        -- Enable scroll off
        -- false : disables scroll off
        -- true  : enables scroll off
        -- @default = true, @default scrolloff_amount = 4,
        scrolloff = true,
        scrolloff_amount = 4,

        -- Enable mouse
        -- false : disables mouse
        -- true  : enables mouse
        -- @default = true
        mouse = true,

        -- Preserve last editing position
        -- false : Disable preservation of last editing position
        -- true  : Enable preservation of last editing position
        -- @default = false
        preserve_edit_pos = false,

        -- Allow overriding the default Doom Nvim keybinds
        -- false : Default keybinds cannot be overwritten
        -- true  : Default keybinds can be overwritten
        -- @default = true
        allow_default_keymaps_overriding = true,

        -- horizontal split on creating a new file (<Leader>fn)
        -- false : doesn't split the window when creating a new file
        -- true  : horizontal split on creating a new file
        -- @default = true
        new_file_split = true,

        -- enable current line highlight
        -- false : disables current line highlight
        -- true  : enables current line highlight
        -- @default = true
        line_highlight = true,

        -- Automatically split right
        -- false : splits right (vertically)
        -- true  : splits left (vertically)
        -- @default = true
        split_right = true,

        -- Automatically split above
        -- false : splits above (horizontally)
        -- true  : splits below (horizontally)
        -- @default = true
        split_below = true,

        -- Use clipboard outside of vim
        -- false : won't use third party clipboard
        -- true  : enables third part clipboard
        -- @default = true
        clipboard = true,

        -- Enable auto comment (current line must be commented)
        -- false : disables auto comment
        -- true  : enables auto comment
        -- @default = false
        auto_comment = false,

        -- Show indent lines
        -- @default = true
        show_indent = true,

        -- Expand tabs
        -- Specifies if spaces or tabs must be used
        -- false : spaces
        -- true  : tabs
        -- @default = true
        expand_tabs = false,

        -- Set numbering
        -- false : Enable  number lines
        -- true  : Disable number lines
        -- @default = false
        disable_numbering = false,

        -- Set numbering style
        -- false : Shows absolute number lines
        -- true  : Shows relative number lines
        -- @default = true
        relative_num = false,

        -- Enable winwidth
        -- false : Manually set win width
        -- true  : Active window auto sets width
        -- @default = false, @default win_width_nr = 85
        win_width = false,
        win_width_nr = 85,

        -- Enable Highlight on yank
        -- false : disables highligh on yank
        -- true  : enables highlight on yank
        -- @default = true
        highlight_yank = true,

        -- Enable guicolors
        -- Enables gui colors on GUI versions of Neovim
        -- @default = true
        enable_guicolors = true,

        -- Tree explorer on the right
        -- Places the Tree explorer buffer to the right when enabled
        -- @default = false
        explorer_right = false,

        -- Show hidden files
        -- @default = true
        show_hidden = true,

        -- Checkupdates on start
        -- @default = false
        check_updates = false,

        -- Auto install plugins on launch, useful if you don't want to run
        -- PackerInstall every time you add a new plugin
        -- @default = true
        auto_install_plugins = true,

        -- Disable dashboard status line (does not work perfectly)
        -- false : disables dashboard status line
        -- true  : enables dashboard status line
        -- @default = true
        dashboard_statline = true,

        -- Show the editing file path in your status line
        -- false : show only file name on status line
        -- true  : show file name and the updir in status line
        statusline_show_file_path = true,

        -- Set the keybindings modules that you want to use
        -- false : disables keybindings module
        -- true  : enables keybindings module
        keybinds_modules = {
            -- Core doom keybindings
            core = true,
            -- Movement keybindings, jump between your windows, buffers and code
            movement = true,
            -- Leader keybindings, a bunch of useful keybindings managed by space key
            -- WARNING: disabling this will break which-key plugin if the plugin is enabled
            leader = true,
            -- Completion and snippets keybindings
            completion = true,
        },

        -- false : enable autocommands module
        -- true  : disable autocommands module
        -- @default = false
        disable_autocommands = false,

        -- Enable LSP diagnostics virtual text
        -- @default = false
        enable_lsp_virtual_text = false,

        -- Use floating windows for plugins manager (packer) operations
        -- @default = false
        use_floating_win_packer = false,

        -- Default indent size
        -- @default = 4
        indent = 4,

        -- Set max cols
        -- Defines the column to show a vertical marker
        -- @default = 80
        max_columns = 100,

        -- Completion box height
        -- @default = 10
        complete_size = 10,

        -- Completion box transparency
        -- 0 = no transparency
        -- 100 = fully transparent
        -- @default = 25
        complete_transparency = 25,

        -- Sidebar sizing
        -- Specifies the default width of Tree Explorer and Tagbar
        -- @default = 25
        sidebar_width = 30,

        -- Conceal level
        -- Set Neovim conceal level
        -- 0 : Disable indentline and show all
        -- 1 : Conceal some functions and show indentlines
        -- 2 : Concealed text is completely hidden unless it has a custom replacement
        --     character defined
        -- 3 : Concealed text is completely hidden
        conceallevel = 0,

        -- Logging level
        -- Set Doom logging level
        -- Available levels:
        --   · trace
        --   · debug
        --   · info
        --   · warn
        --   · error
        --   · fatal
        -- @default = 'info'
        logging = "info",

        -- Change Which Key background color
        -- can use hex, or normal color names (eg: Red, Green, Blue)
        -- @default = #202328
        whichkey_bg = "#202328",

        -- Set your custom lsp diagnostic symbols below
        -- lsp_error = "",
        -- lsp_warn = "",
        -- lsp_hint = "",
        -- lsp_info = "",
        lsp_error = "",
        lsp_warn = "",
        lsp_hint = "",
        lsp_info = "",
        lsp_virtual_text = " ",

        -- Set your dashboard custom colors below
        -- @default = doom emacs' default dashboard colors
        -- dashboard_custom_colors = {
        --     header_color = "#586268",
        --     center_color = "#51afef",
        --     shortcut_color = "#a9a1e1",
        --     footer_color = "#586268",
        -- },
    },
    nvim = {
        global_variables = {
                indent_blankline_show_current_context = true,
        },
        autocmds = {},
        mappings = {},
        commands = {},
        functions = {},
        options = {
            -- { ['shiftwidth'] = 4 },
        },
    },
}

config.source = nil

-- Check plugins updates on start if enabled
if config.config.pato.check_updates then
    require("pato.core.functions").check_updates()
end

return config