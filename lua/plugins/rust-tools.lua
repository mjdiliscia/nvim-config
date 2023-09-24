return {
	"simrat39/rust-tools.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
		"folke/which-key.nvim",
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
				local wk = require("which-key")
				wk.register({
					c = {
						name = "Code actions",
						h = { rt.hover_actions.hover_actions, "Hover actions", buffer = bufnr },
						a = { rt.code_action_group.code_action_group, "Code action group", buffer = bufnr},
					},
				}, { prefix = "<leader>" })
			end,
		},
	},
	event = "BufRead *.rs",
}
