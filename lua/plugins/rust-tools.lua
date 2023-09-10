return {
	"simrat39/rust-tools.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
	},
	lazy = true,
	opts = {
		tools = {
			hover_actions = {
				auto_focus = true,
			},
		},
		server = {
			on_attach = function(_, bufnr)
				local rt = require("rust-tools")
				vim.keymap.set("n", "<leader>ch", rt.hover_actions.hover_actions, { buffer = bufnr})
				vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
			end,
		},
	},
	event = "BufRead *.rs",
}
