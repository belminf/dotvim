return {
	"neovim/nvim-lspconfig",
	opts = {
		format_notify = true,
		inlay_hints = { enabled = false },
		servers = {
			bashls = {
				filetypes = { "sh", "zsh" },
				mason = false,
			},
			pylsp = {},
			pyright = { mason = false },
			jsonls = { mason = false },
			ansiblels = { mason = false },
			yamlls = { mason = false },
			biome = { mason = false },
		},
		diagnostics = {
			virtual_text = false,
			float = {
				border = "rounded",
			},
		},
	},
}
