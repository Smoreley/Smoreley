local mappings = require("pato.utils.mappings")

-- additional options for mappings
local opts = { silent = true }

-- tab to cycle buffers too, why not?
mappings.map("n", "<Tab>", ":bnext<CR>", opts, "Movement", "cycle_next_buffer", "Goto next buffer")
mappings.map("n", "<S-Tab>", ":bprevious<CR>", opts, "Movement", "cycle_prev_buffer", "Goto prev buffer")

-- window movements keys
mappings.map("n", "<C-h>", "<C-w>h", opts, "Movement", "left_window", "Goto left window")
mappings.map("n", "<C-j>", "<C-w>j", opts, "Movement", "down_window", "Goto down window")
mappings.map("n", "<C-k>", "<C-w>k", opts, "Movement", "up_window", "Goto upper window")
mappings.map("n", "<C-l>", "<C-w>l", opts, "Movement", "right_window", "Goto right window")

-- move lines
mappings.map("n", "<a-j>", ":m .+1<CR>==",
    opts, "Editor", "normal_move_line_down", "Normal Move line down")
mappings.map("n", "<a-k>", ":m .-2<CR>==",
    opts, "Editor", "normal_move_line_up", "Normal Move line up")

mappings.map("i", "<a-j>", "<esc>:m .+1<CR>==gi",
    opts, "Editor", "instert_move_line_down", "Insert Move line down")
mappings.map("i", "<a-k>", "<esc>:m .-2<CR>==gi",
    opts, "Editor", "instert_move_line_up", "Insert Move line up")

mappings.map("v", "<a-j>", ":m '>+1<CR>gv=gv",
    opts, "Editor", "visual_move_line_down", "Visual Move line down")
mappings.map("v", "<a-k>", ":m '<-2<CR>gv=gv",
    opts, "Editor", "visual_move_line_up", "Visual Move line up")

-- select movement


-- get out of terminal insert mode into normal mode with Esc
mappings.map("t", "<Esc>", "<C-\\><C-n>", opts, "Editor", "exit_insert_term", "Exit insert mode (inside a terminal)")

-- resizing splits
mappings.map("n", "<C-Up>", ":resize +2<CR>", opts, "Window", "resize_up", "Resize window (increase width)")
mappings.map("n", "<C-Down>", ":resize -2<CR>", opts, "Window", "resize_down", "Resize window (decrease width)")
mappings.map("n", "<C-Right>", ":vertical resize -2<CR>", opts, "Window", "resize_right", "Resize window (decrease height)")
mappings.map("n", "<C-Left>", ":vertical resize +2<CR>", opts, "Window", "resize_left", "Resize window (increase height)")