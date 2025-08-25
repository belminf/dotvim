if vim.fn.getenv("ANTHROPIC_BASE_URL") ~= vim.NIL then
  return {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("claude-code").setup({
        command = "claude",
        window = {
          position = "float",
          float = {
            width = "75%",
            height = "75%",
            row = "center",
            col = "center",
            relative = "editor",
            border = "double",
          },
        },
      })
    end
  }
else
  return {}
end
