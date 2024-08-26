return {
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			local icons = LazyVim.config.icons
			opts.sections.lualine_c = {
				LazyVim.lualine.root_dir(),
				{
					"diagnostics",
					symbols = {
						error = icons.diagnostics.Error,
						warn = icons.diagnostics.Warn,
						info = icons.diagnostics.Info,
						hint = icons.diagnostics.Hint,
					},
				},
				{ LazyVim.lualine.pretty_path() },
			}
			opts.sections.lualine_x = {
				{ "filetype", icon_only = false, separator = "", padding = { left = 1, right = 0 } },
				{
					"diff",
					symbols = {
						added = icons.git.added,
						modified = icons.git.modified,
						removed = icons.git.removed,
					},
					source = function()
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed,
							}
						end
					end,
				},
			}
			opts.sections.lualine_z = {
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
					color = function()
						return LazyVim.ui.fg("Special")
					end,
				},
			}
		end,
	},
}
