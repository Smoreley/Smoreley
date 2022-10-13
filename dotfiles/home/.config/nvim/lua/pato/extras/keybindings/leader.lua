local mappings = require("pato.utils.mappings")
local config = require("pato.core.config").config
local is_plugin_disabled = require("pato.utils").is_plugin_disabled

-- additional options for mappings
local opts = { silent = true }

-- set space key as leader
if is_plugin_disabled("which-key") then
    mappings.map("n", "<Space>", "<Nop>", opts, "Editor", "open_whichkey", "Open WhichKey menu")
end
vim.g.mapleader = " "

-- misc
mappings.map(
    "n",
    "<leader>`",
    "<cmd>lua require('telescope.builtin').find_files({cwd=vim.fn.expand('%:p:h')})<CR>",
    opts,
    "Editor",
    "cwd_file_browser",
    "Find file from CWD of current file"
)

mappings.map("n", "<leader>.", "<cmd>Telescope file_browser<CR>",
    opts, "Editor", "file_browser", "Browse files")

mappings.map("n", "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<CR>",
  opts, "Movement", "switch_buffers", "Switch buffers")

mappings.map("n", "<leader>:", "<cmd>Telescope command_history<CR>",
    opts, "Editor", "command_history", "Command history")

-- buffers
mappings.map("n", "<leader>bc", ":bw<CR>",
    opts, "Buffer", "close_current_buffer", "Close current buffer")

mappings.map("n", "<leader>bb", "<cmd>e #<CR>",
    opts, "Buffer", "switch_buffer", "Switch to other buffer")

mappings.map("n", "<leader>b]", ':bn<CR>',
    opts, "Buffer", "next_buffer_alt", "Goto next buffer")

mappings.map("n", "<leader>bn", ':bn<CR>',
    opts, "Buffer", "next_buffer", "Goto next buffer")

mappings.map("n", "<leader>bg", '<cmd>Telescope buffers show_all_buffers=true<CR>',
    opts, "Buffer", "goto_buffer", "Goto buffer")

mappings.map("n", "<leader>b[", ':bp<CR>',
    opts, "Buffer", "prev_buffer_alt", "Goto previous buffer")
mappings.map("n", "<leader>bp", ':bp<CR>',
    opts, "Buffer", "prev_buffer", "Goto previous buffer")

mappings.map("n", "<leader>bf", "<cmd>FormatWrite<CR>",
    opts, "Buffer", "format_buffer", "Format buffer")

-- plugins
mappings.map("n", "<leader>ps", "<cmd>PackerSync<CR>",
    opts, "Plugins", "packer_sync", "Synchronize your plugins")

mappings.map("n", "<leader>pi", "<cmd>PackerInstall<CR>",
    opts, "Plugins", "packer_install", "Install missing plugins")

mappings.map("n", "<leader>pc", "<cmd>PackerClean<CR>",
    opts, "Plugins", "packer_clean", "Clean unused plugins")

mappings.map("n", "<leader>pC", "<cmd>PackerCompile<CR>",
    opts, "Plugins", "packer_compile", "Compile your plugins changes")

mappings.map("n", "<leader>pS", "<cmd>PackerStatus<CR>",
    opts, "Plugins", "packer_status", "Plugins status")

mappings.map("n", "<leader>pp", "<cmd>PackerProfile<CR>",
    opts, "Plugins", "packer_profile", "Profile the time taken loading your plugins")

-- files
mappings.map("n", "<leader>fn", ":enew<CR>",
    opts, "Editor", "new_buffer", "Open a new unnamed buffer")

mappings.map("n", "<leader>fc", "<cmd>e $MYVIMRC<CR>",
    opts, "Editor", "edit_vimrc", "Edit your Neovim rc")

mappings.map("n", "<leader>ff", "<cmd>Telescope find_files<CR>",
    opts, "Editor", "find_files_alt", "Find files")

mappings.map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>",
    opts, "Editor", "recent_files", "Recently opened files")

mappings.map("n", "<leader>ft", "<cmd>Telescope help_tags<CR>",
    opts, "Editor", "help_tags", "Help tags")

-- search
mappings.map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>",
    opts, "Editor", "live_grep_alt", "Search a word")

mappings.map("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<CR>",
    opts, "Editor", "fzf", "Search in buffer")

mappings.map("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>",
    opts, "LSP", "lsp_symbols", "Goto symbol")

mappings.map("n", "<leader>sh", "<cmd>Telescope command_history<CR>",
    opts, "Editor", "command_history_alt", "Command history")

mappings.map("n", "<leader>sm", "<cmd>Telescope marks<CR>",
    opts,"Editor", "jump_mark", "Jump to mark")

-- tweak
mappings.map("n", "<leader>ts", '<cmd>lua require("doom.core.functions").toggle_spell()<CR>',
    opts, "Tweak", "toggle_spell", "Toggle spell")

-- windows
mappings.map("n", "<leader>ww", "<C-W>p", opts, "Window", "other_window", "Goto other window")
mappings.map("n", "<leader>wd", "<C-W>c", opts, "Window", "close_window", "Close current window")
mappings.map("n", "<leader>wh", "<C-W>h", opts, "Window", "window_left", "Window left")
mappings.map("n", "<leader>wj", "<C-W>j", opts, "Window", "window_below", "Window below")
mappings.map("n", "<leader>wl", "<C-W>l", opts, "Window", "window_right", "Window right")
mappings.map("n", "<leader>wk", "<C-W>k", opts, "Window", "window_up", "Window up")
mappings.map("n", "<leader>w=", "<C-W>=", opts, "Window", "balance_window", "Balance window")

-- window split
mappings.map("n", "<leader>ws", "<C-W>s", opts, "Window", "split_below_alt", "Split window below")
mappings.map("n", "<leader>wv", "<C-W>v", opts, "Window", "split_right_alt", "Split window right")

-- quit / sessions
mappings.map("n", "<leader>qq", '<cmd>lua require("pato.core.functions").quit_pato()<CR>',
    opts, "Editor", "save_nvim", "Exit Neovim")

mappings.map("n", "<leader>qw", '<cmd>lua require("pato.core.functions").quit_pato(true, true)<CR>',
    opts, "Editor", "save_exit_nvim", "Save and exit Neovim")

mappings.map("n", "<leader>qr", "<cmd>lua require('persistence').load({ last = true })<CR>",
    opts, "Editor", "restore_session", "Restore previously saved session")

-- open
mappings.map("n", "<leader>od", "<cmd>Dashboard<CR>",
    opts, "Editor","open_dashboard", "Open start screen")

mappings.map("n", "<leader>oe", "<cmd>NvimTreeToggle<CR>",
    opts,"Editor", "open_tree_alt", "Toggle file explorer")

mappings.map("n", "<leader>os", "<cmd>SymbolsOutline<CR>",
    opts, "Editor", "open_symbols_alt", "Toggle SymbolsOutline (LSP symbols)")

mappings.map("n", "<leader>ot", "<cmd>ToggleTerm<CR>",
    opts, "Editor", "open_terminal", "Toggle terminal")

-- git
mappings.map("n", "<leader>go", "<cmd>LazyGit<CR>",
    opts, "Git", "lazygit", "Open LazyGit")

mappings.map("n", "<leader>gs", "<cmd>Telescope git_status<CR>",
    opts, "Git", "git_status", "Browse git status")

mappings.map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>",
    opts, "Git", "git_branches", "Browse git branches")

mappings.map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>",
    opts, "Git", "git_commits", "Browse git commits")

-- code

-- debugging
mappings.map("n", "<leader>cdb", "<cmd>lua require('dap').toggle_breakpoint()<CR>",
    opts, "DAP", "dap_toggle_brkpt", "Toggle breakpoint on current line")

-- lsp
mappings.map("n", "<leader>cli", "<cmd>LspInfo<CR>", opts, "LSP", "lsp_info", "LSP Information")

-- jumps
mappings.map("n", "<leader>ja", "<C-^>", opts, "Jumps", "jump_alternate_file", "Alternate file")
mappings.map("n", "<leader>jj", "<C-o>", opts, "Jumps", "jump_older", "Jump to older pos")
mappings.map("n", "<leader>jk", "<C-i>", opts, "Jumps", "jump_newer", "Jump to newer pos")

-- save

-- man pages
mappings.map("n", "<leader>h", ":Man ", { silent = false }, "Man page", "man_page", "Man page")
