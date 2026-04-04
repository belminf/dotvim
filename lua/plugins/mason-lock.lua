return {
	"zapling/mason-lock.nvim",
	cmd = { "MasonLock", "MasonLockRestore" },
	config = function()
		require("mason-lock").setup()
	end,
}
