return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<c-up>"] = actions.preview_scrolling_up,
						["<c-down>"] = actions.preview_scrolling_down,
						["<c-left>"] = actions.preview_scrolling_left,
						["<c-right>"] = actions.preview_scrolling_right,
					},
				},
			},
		})
		local wk = require("which-key")
		wk.register({
			f = {
				name = "Find operations",
				s = { ":Telescope live_grep<CR>", "Find in files" },
				f = { ":Telescope find_files<CR>", "Find files" },
				g = { ":Telescope git_files<CR>", "Find in git" },
			},
			b = {
				name = "Buffer operations",
				l = { ":Telescope buffers<CR>", "List buffers" },
			},
			c = {
				name = "Code operations",
				d = { ":Telescope lsp_definitions<CR>", "Go to definition" },
				i = { ":Telescope lsp_implementations<CR>", "Go to implementation/s" },
				r = { ":Telescope lsp_references<CR>", "Go to reference/s" },
			},
			t = { ":Telescope<CR>", "Open Telescope" },
		}, { prefix = "<leader>" })
	end,
}
