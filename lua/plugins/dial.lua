return {
	"monaqa/dial.nvim",
	opts = function(_, opts)
		local augend = require("dial.augend")
		table.insert(opts.groups.default, augend.semver.alias.semver)
		return opts
	end,
}
