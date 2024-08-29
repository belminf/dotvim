return {
	"neovim/nvim-lspconfig",
	opts = {
		format_notify = true,
		inlay_hints = { enabled = false },
		servers = {
			bashls = {
				filetypes = { "sh", "zsh" },
			},
		},
		diagnostics = {
			virtual_text = false,
			float = {
				border = "rounded",
			},
		},
	},
}
-- config = function()
-- 	require("lspconfig").terraformls.setup({
-- 		settings = {
-- 			experimentalFeatures = {
-- 				validateOnSave = false,
-- 			},
-- 		},
-- 	})
-- end,
-- }
