return {
	"folke/noice.nvim",
	lazy = false,
	opts = {
		cmdline = { view = "cmdline" },
	},
	keys = {
		{
			"<Leader>`",
			function()
				require("noice").cmd("history")
			end,
			{ desc = "Notification history" },
		},
	},
}
