return {
	"stevearc/conform.nvim",
	opts = function(_, opts)
		opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
			["*"] = { "trim_whitespace", "trim_newlines" },
		})
		opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
			shfmt = { prepend_args = { "-i", "2", "-ci", "-s" } },
		})
	end,
}
