return function()
	require("trouble").setup({
		-- your configuration comes here
		-- or leave it empty to use the default settings
		position = "top",
		padding = false,
		mode = "document_diagnostics",
	})
end