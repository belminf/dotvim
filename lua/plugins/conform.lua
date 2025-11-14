return {
	"stevearc/conform.nvim",
	---@param _ table
	---@param opts conform.setupOpts
	opts = function(_, opts)
		opts.default_format_opts = vim.tbl_deep_extend("force", opts.default_format_opts or {}, {
			timeout_ms = 3000,
		})

		vim.tbl_deep_extend("force", opts.formatters_by_ft, {
			lua = { "stylua" },
			fish = { "fish_indent" },
			sh = { "shfmt" },
			go = { "goimports", "gofumpt" },
			terraform = { "terraform_fmt" },
			tf = { "terraform_fmt" },
			["terraform-vars"] = { "terraform_fmt" },
			["*"] = { "trim_whitespace", "trim_newlines" },
		})

		vim.tbl_deep_extend("force", opts.formatters, {
			injected = { options = { ignore_errors = true } },
			shfmt = {
				prepend_args = { "-i", "2", "-ci", "-s" },
			},
		})
	end,
}
