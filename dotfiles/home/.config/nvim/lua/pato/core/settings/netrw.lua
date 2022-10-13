local utils = require("pato.utils")
local system = require("pato.core.system")
local config = require("pato.core.config").config.pato

-- Netrw banner
-- 0 : Disable banner
-- 1 : Enable banner
vim.g.netrw_banner = 0

-- Keep the current directory and the browsing directory synced.
-- This helps you avoid the move files error.
vim.g.netrw_keepdir = 0

-- Show directories first (sorting)
vim.g.netrw_sort_sequence = [[[\/]$,*]]

-- Human-readable files sizes
vim.g.netrw_sizestyle = "H"

-- -- Netrw list style
-- -- 0 : thin listing (one file per line)
-- -- 1 : long listing (one file per line with timestamp information and file size)
-- -- 2 : wide listing (multiple files in columns)
-- -- 3 : tree style listing
-- vim.g.netrw_liststyle = 3

-- Patterns for hiding files, e.g. node_modules
-- NOTE: this works by reading '.gitignore' file
vim.g.netrw_list_hide = vim.fn["netrw_gitignore#Hide"]()

-- Show hidden files
-- 0 : show all files
-- 1 : show not-hidden files
-- 2 : show hidden files only
vim.g.netrw_hide = config.show_hidden and 0 or 1

-- Change the size of the Netrw window when it creates a split
vim.g.netrw_winsize = (0 - config.sidebar_width)

-- -- Preview files in a vertical split window
-- -- vim.g.netrw_preview = 1

-- -- Open files in split
-- -- 0 : re-use the same window (default)
-- -- 1 : horizontally splitting the window first
-- -- 2 : vertically   splitting the window first
-- -- 3 : open file in new tab
-- -- 4 : act like "P" (ie. open previous window)
-- vim.g.netrw_browse_split = 4

-- -- Setup file operations commands
-- -- TODO: figure out how to add these feature in Windows
-- if system.sep == "/" then
--     -- Enable recursive copy of directories in *nix systems
--     vim.g.netrw_localcopydircmd = "cp -r"

--     -- Enable recursive creation of directories in *nix systems
--     vim.g.netrw_localmkdir = "mkdir -p"

--     -- Enable recursive removal of directories in *nix systems
--     -- NOTE: we use 'rm' instead of 'rmdir' (default) to be able to remove non-empty directories
--     vim.g.netrw_localrmdir = "rm -r"
-- end

-- Highlight marked files in the same way search matches are
vim.cmd("hi! link netrwMarkFile Search")

-- KEYBINDS
local function netrw_maps()
end

-- ICONS
local function draw_icons()
end

return {
    draw_icons = draw_icons,
    set_maps = netrw_maps,
}