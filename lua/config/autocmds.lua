vim.o.updatetime = 500
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	group = vim.api.nvim_create_augroup("float_diagnostic", {}),
	callback = function()
		if SHOW_DEFINITION_TOGGLE then
			vim.diagnostic.open_float(nil, { focus = false })
		end
	end,
})

SHOW_DEFINITION_TOGGLE = false
vim.keymap.set("n", "`", function()
	SHOW_DEFINITION_TOGGLE = not SHOW_DEFINITION_TOGGLE
	if SHOW_DEFINITION_TOGGLE then
		vim.diagnostic.open_float(nil, { focus = false })
	else
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_get_config(win).relative ~= "" then
				vim.api.nvim_win_close(win, true)
			end
		end
	end
end, { desc = "Toggle diagnostics" })
