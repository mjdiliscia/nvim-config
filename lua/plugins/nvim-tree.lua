return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/which-key.nvim",
	},
	opts = {
		filters = {
			dotfiles = true,
		},
		actions = {
			open_file = {
				quit_on_open = false,--true,
			},
		},
	},
	config = function (_, opts)
		require("nvim-tree").setup(opts)
		local nt = require("nvim-tree.api")
		local wk = require("which-key")

		wk.register({
			e = { nt.tree.toggle, "Toggle file tree" },
		}, { prefix = "<leader>" })
	end,
}
