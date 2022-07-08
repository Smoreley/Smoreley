local mappings = require("pato.utils.mappings")
local config = require("pato.core.config").config
local is_plugin_disabled = require("pato.utils").is_plugin_disabled

-- Additional options for mappings
local opts = { silent = true }

-- Set Space key as leader
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
mappings.map(
    "n",
    "<leader>.",
    "<cmd>Telescope file_browser<CR>",
    opts,
    "Editor",
    "file_browser",
    "Browse files"
)

-- buffers
mappings.map(
    "n",
    "<leader>bb",
    "<cmd>e #<CR>",
    opts,
    "Buffer",
    "switch_buffer",
    "Switch to other buffer"
)

mappings.map(
    "n",
    "<leader>bg",
    '<cmd>lua require("bufferline").pick_buffer()<CR>',
    opts,
    "Buffer",
    "goto_buffer",
    "Goto buffer"
)

mappings.map(
    "n",
    "<leader>b]",
    '<cmd>lua require("bufferline").cycle(1)<CR>',
    opts,
    "Buffer",
    "next_buffer_alt",
    "Goto next buffer"
)
mappings.map(
    "n",
    "<leader>b[",
    '<cmd>lua require("bufferline").cycle(-1)<CR>',
    opts,
    "Buffer",
    "prev_buffer_alt",
    "Goto previous buffer"
)

-- plugins
mappings.map(
    "n",
    "<leader>ps",
    "<cmd>PackerSync<CR>",
    opts,
    "Plugins",
    "packer_sync",
    "Synchronize your plugins"
)
mappings.map(
    "n",
    "<leader>pi",
    "<cmd>PackerInstall<CR>",
    opts,
    "Plugins",
    "packer_install",
    "Install missing plugins"
)
mappings.map(
    "n",
    "<leader>pc",
    "<cmd>PackerClean<CR>",
    opts,
    "Plugins",
    "packer_clean",
    "Clean unused plugins"
)

-- files
mappings.map(
    "n",
    "<leader>fc",
    "<cmd>e $MYVIMRC<CR>",
    opts,
    "Editor",
    "edit_vimrc",
    "Edit your Neovim rc"
)
mappings.map(
    "n",
    "<leader>ff",
    "<cmd>Telescope find_files<CR>",
    opts,
    "Editor",
    "find_files_alt",
    "Find files"
)
mappings.map(
    "n",
    "<leader>fr",
    "<cmd>Telescope oldfiles<CR>",
    opts,
    "Editor",
    "recent_files",
    "Recently opened files"
)

-- search
mappings.map(
    "n",
    "<leader>sg",
    "<cmd>Telescope live_grep<CR>",
    opts,
    "Editor",
    "live_grep_alt",
    "Search a word"
)
mappings.map(
    "n",
    "<leader>sb",
    "<cmd>Telescope current_buffer_fuzzy_find<CR>",
    opts,
    "Editor",
    "fzf",
    "Search in buffer"
)
mappings.map(
    "n",
    "<leader>sh",
    "<cmd>Telescope command_history<CR>",
    opts,
    "Editor",
    "command_history_alt",
    "Command history"
)

-- quit / sessions
mappings.map(
    "n",
    "<leader>qq",
    '<cmd>lua require("pato.core.functions").quit_pato()<CR>',
    opts,
    "Editor",
    "save_nvim",
    "Exit Neovim"
)
mappings.map(
    "n",
    "<leader>qw",
    '<cmd>lua require("pato.core.functions").quit_pato(true, true)<CR>',
    opts,
    "Editor",
    "save_exit_nvim",
    "Save and exit Neovim"
)
mappings.map(
    "n",
    "<leader>qr",
    "<cmd>lua require('persistence').load({ last = true })<CR>",
    opts,
    "Editor",
    "restore_session",
    "Restore previously saved session"
)
