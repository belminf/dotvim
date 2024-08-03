vim.keymap.set("n", "-", function()
	require("neo-tree.command").execute({ toggle = true, reveal = true, reveal_force_cwd = true })
end, { noremap = true, silent = true, desc = "Browse root directory" })

vim.keymap.set("n", "q", function()
	local buffers = vim.api.nvim_list_bufs()
	local listed_buffers = {}
	for _, bufnr in pairs(buffers) do
		if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_get_option_value("buflisted", { buf = bufnr }) then
			table.insert(listed_buffers, bufnr)
		end
	end

	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_delete(bufnr, {})

	if #listed_buffers == 1 then
		vim.cmd("qa")
	end
end, { desc = "Close buffer and window" })

vim.keymap.set("n", "<Tab><Tab>", "<cmd>bn<CR>", { noremap = true, silent = true, desc = "Switch to next tab" })
vim.keymap.set("n", "<S-Tab><S-Tab>", "<cmd>bp<CR>", { noremap = true, silent = true, desc = "Switch to previous tab" })
vim.keymap.set("n", ">", vim.diagnostic.goto_next, { desc = "Focus on next diagnostic" })
vim.keymap.set("n", "<", vim.diagnostic.goto_prev, { desc = "Focus on previous diagnostic" })

vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent text" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Unindent text" })
vim.keymap.set({ "n", "v" }, "F", function()
	LazyVim.format({ force = true })
end, { desc = "Format" })
