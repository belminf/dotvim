vim.keymap.set("n", "<C-y>", ":%y+<CR>", { silent = true, desc = "Copy entire buffer to system clipboard" })
vim.keymap.set("v", "Y", '"+y', { silent = true, desc = "Copy selection to system clipboard" })

vim.keymap.set({ "i", "n", "s" }, "<esc>", function()
	local has_notifs = false
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "snacks_notif" then
			has_notifs = true
			break
		end
	end
	if has_notifs then
		Snacks.notifier.hide()
	else
		vim.cmd("noh")
	end
	LazyVim.cmp.actions.snippet_stop()
	return "<esc>"
end, { expr = true, desc = "Escape: dismiss notifications or clear hlsearch" })

vim.keymap.set("n", "F", "<cmd>LazyFormat<cr>", { desc = "Format" })
vim.keymap.set("n", "<leader>?", "<cmd>FzfLua keymaps<cr>", { desc = "Search Keymaps" })
vim.keymap.set("n", "-", function()
	Snacks.picker.explorer({ layout = { preset = "vertical", preview = false }, jump = { close = true } })
end, { desc = "Explorer" })
vim.keymap.set("n", "#", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", { desc = "Switch Buffer" })

vim.keymap.set("n", "_", function()
	Snacks.picker.lsp_symbols({ layout = { preset = "vertical", hidden = { "input" } } })
end, { desc = "Symbols (current file)" })
vim.keymap.set("n", "&", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "Workspace Symbols" })

vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-q>", function()
	if vim.bo.buftype == "terminal" then
		vim.cmd("startinsert")
	end
end, { desc = "Enter terminal insert mode" })
