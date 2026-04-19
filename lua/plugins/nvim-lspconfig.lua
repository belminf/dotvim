return {
	"neovim/nvim-lspconfig",
	opts = {
		format_notify = true,
		inlay_hints = { enabled = false },
		servers = {
			bashls = {
				filetypes = { "sh", "zsh" },
			},
			pylsp = {},
		},
		diagnostics = {
			virtual_text = false,
			float = {
				border = "rounded",
			},
		},
	},
}
