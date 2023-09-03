return {
	"simrat39/rust-tools.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
	},
	lazy = true,
	opts = {
		server = {
			on_attach = function(_, bufnr)
				local rt = require("rust-tools")
				vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr})
				vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
			end,
		},
	},
	event = "BufEnter *.rs",
}
