return {
	"stevearc/conform.nvim",
	opts = function(_, opts)
		-- Merge your custom format options
		opts.default_format_opts = vim.tbl_deep_extend("force", opts.default_format_opts or {}, {
			timeout_ms = 3000,
			async = false,
			quiet = false,
			lsp_format = "fallback",
		})

		-- Merge your formatters_by_ft
		opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
			lua = { "stylua" },
			fish = { "fish_indent" },
			sh = { "shfmt" },
			go = { "goimports", "gofumpt" },
			terraform = { "terraform_fmt" },
			tf = { "terraform_fmt" },
			["terraform-vars"] = { "terraform_fmt" },
			["*"] = { "trim_whitespace", "trim_newlines" },
		})

		-- Merge your formatters
		opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
			injected = { options = { ignore_errors = true } },
			shfmt = {
				prepend_args = { "-i", "2", "-ci", "-s" },
			},
		})
		return opts
	end,
}
