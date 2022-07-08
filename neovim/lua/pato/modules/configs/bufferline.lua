-- Tabpage integration
-- https://github.com/akinsho/bufferline.nvim
return function()
    require("bufferline").setup({
        options = {
            numbers = function(opts)
                return string.format("%s", opts.id)
            end,
            max_name_length = 18,
            max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
            tab_size = 18,
            diagnostics = "nvim_lsp",
            -- NOTE: this will be called a lot so don't do any heavy processing here
            custom_filter = function(buf_number)
                if vim.bo[buf_number].filetype ~= "dashboard" then
                    return true
                end
            end,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                },
                {
                    filetype = "netrw",
                    text = "File Explorer",
                    text_align = "center",
                },
                {
                    filetype = "Outline",
                    text = "Symbols",
                    text_align = "center",
                },
                {
                    filetype = "packer",
                    text = "Plugins Manager",
                    text_align = "center",
                },
            },
            color_icons = true,
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_buffer_default_icon = true,
            show_close_icon = true,
            show_tab_indicators = true,
            persist_buffer_sort = true,
            separator_style = "thick",
            enforce_regular_tabs = true,
            always_show_bufferline = true,
            sort_by = "directory",
        }
    })
end