vim.keymap.set("n", "-", function()
	require("neo-tree.command").execute({ toggle = true, reveal = true, dir = LazyVim.root() })
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

vim.keymap.set("n", "<C-y>", ":%y+<CR>", { silent = true, desc = "Copy entire buffer to system clipboard" })
vim.keymap.set("v", "Y", '"+y', { silent = true, desc = "Copy selection to system clipboard" })

vim.keymap.set("n", "<Tab><Tab>", "<cmd>bn<CR>", { noremap = true, silent = true, desc = "Switch to next tab" })
vim.keymap.set("n", "<S-Tab><S-Tab>", "<cmd>bp<CR>", { noremap = true, silent = true, desc = "Switch to previous tab" })
vim.keymap.set("n", ">", vim.diagnostic.goto_next, { desc = "Focus on next diagnostic" })
vim.keymap.set("n", "<", vim.diagnostic.goto_prev, { desc = "Focus on previous diagnostic" })

vim.keymap.set("n", "<C-h>", function()
  if vim.wo.diff then
    -- If in diff mode, use Vim's built-in `]c` to go to the next change
    vim.cmd.normal({ "]c", bang = true })
  else
    -- Otherwise, use gitsigns to go to the next hunk
    require("gitsigns").nav_hunk("next")
  end
end, { desc = "Next Hunk / Diff Change" })

vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent text" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Unindent text" })
vim.keymap.set({ "n", "v" }, "F", function()
	LazyVim.format({ force = true })
end, { desc = "Format" })

vim.keymap.set("n", "<Esc>", function()
	require("noice").cmd("dismiss")
end, { desc = "Dismiss all notifications" })

vim.keymap.set({"n", "t"}, "<C-g>", function()
	require("claude-code").toggle()
end, { desc = "Toggle Claude Code" })
