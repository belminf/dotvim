return {
	{
		"neanias/everforest-nvim",
		priority = 1000, -- Make sure this loads first
		lazy = false, -- Load this on startup
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "everforest",
		},
	},
}
