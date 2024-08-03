return {
	"folke/noice.nvim",
  lazy = false,
	opts = {
		cmdline = { view = "cmdline" },
	},
	keys = {
		{
			"`",
			function()
				require("noice").cmd("dismiss")
			end,
			{ desc = "Dimiss all notifications" },
		},
		{
			"<Leader>`",
			function()
				require("noice").cmd("history")
			end,
			{ desc = "Notification history" },
		},
	},
}
