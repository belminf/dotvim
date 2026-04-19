-- Tools managed by the system package manager (brew/yay), not Mason
local system_tools = {
	"ansible-language-server",
	"bash-language-server",
	"biome",
	"html-lsp",
	"json-lsp",
	"jsonlint",
	"markdownlint-cli2",
	"markdown-toc",
	"prettier",
	"pyright",
	"yaml-language-server",
}

return {
	{
		"mason-org/mason.nvim",
		version = "v2.1.0",
		opts = function(_, opts)
			opts.ensure_installed = vim.tbl_filter(function(tool)
				return not vim.tbl_contains(system_tools, tool)
			end, vim.list_extend(opts.ensure_installed or {}, {
				"ansible-lint",
				"black",
				"gofumpt",
				"goimports",
				"golangci-lint",
				"gopls",
				"lua-language-server",
				"marksman",
				"python-lsp-server",
				"rubocop",
				"ruby-lsp",
				"shellcheck",
				"shfmt",
				"stylua",
				"terraform-ls",
				"tflint",
				"yamlfix",
				"yamllint",
			}))
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed = vim.tbl_filter(function(tool)
				return not vim.tbl_contains(system_tools, tool)
			end, opts.ensure_installed or {})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed = vim.tbl_filter(function(tool)
				return not vim.tbl_contains(system_tools, tool)
			end, opts.ensure_installed or {})
		end,
	},
}
