local nvim_tree = require("nvim-tree.api")

local wk = require("which-key")
wk.register({
	r = { function() vim.wo.relativenumber = not vim.wo.relativenumber end, "Toggle relative numbering" },
	e = { nvim_tree.tree.toggle, "Toggle file tree" },
	f = {
		name = "Find operations",
		s = { ":Telescope grep_string<CR>", "Find in files" },
		f = { ":Telescope find_files<CR>", "Find files" },
		g = { ":Telescope find_git<CR>", "Find in git" },
	},
	c = {
		name = "Code operations",
		d = { ":Telescope lsp_definitions<CR>", "Go to definition" },
		i = { ":Telescope lsp_implementations<CR>", "Go to implementation/s" },
		r = { ":Telescope lsp_references<CR>", "Go to reference/s" },
	}
}, { prefix = "<leader>" })
