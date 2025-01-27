return {
	"snacks.nvim",
	opts = {
		dashboard = { enabled = false },
	},
	keys = {
		{
			"<leader>?",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
	},
}
