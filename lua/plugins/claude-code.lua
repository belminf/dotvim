if vim.fn.getenv("ANTHROPIC_BASE_URL") ~= vim.NIL then
	local toggle_key = "<C-g>"
	return {
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		keys = {
			{ toggle_key, "<cmd>ClaudeCodeFocus<cr>", desc = "Toggle Claude Code", mode = { "n", "x" } },
		},
		opts = {
			terminal = {
				---@module "snacks"
				---@type snacks.win.Config|{}
				snacks_win_opts = {
					position = "float",
					width = 0.9,
					height = 0.9,
					border = "rounded",
					keys = {
						claude_hide = {
							toggle_key,
							function(self)
								self:hide()
							end,
							mode = "t",
							desc = "Hide",
						},
					},
				},
			},
		},
	}
else
	return {}
end
