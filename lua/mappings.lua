local wk = require("which-key")

wk.register({
	r = { function() vim.wo.relativenumber = not vim.wo.relativenumber end, "Toggle relative numbering" },
	c = {
		f = { vim.lsp.buf.format, "Apply LSP format" },
	},
	u = {
		f = { "<cmd>Neotree toggle<cr>", "Toggle filesystem explorer" },
		s = { "<cmd>SymbolsOutline<cr>", "Toggle symbols outline" },
		g = { "<cmd>Neotree git_status<cr>", "Toggle git status outline" },
		b = { "<cmd>Neotree buffers<cr>", "Toggle buffer list" },
		i = { function() require("edgy").toggle() end, "Open edgy UI", },
		m = { function() require("edgy").goto_main() end, "Go to main window" },
	},
}, { prefix = "<leader>" })
wk.register({
	["<f4>"] = { "<cmd>qa<cr>", "Quit all windows" },
	["<f28>"] = { "<cmd>qa!<cr>", "Quit all windows" },
	["<c-h>"] = { "<cmd>winc h<cr>", "Go to left window" },
	["<c-Left>"] = { "<cmd>winc h<cr>", "Go to left window" },
	["<c-k>"] = { "<cmd>winc k<cr>", "Go to up window" },
	["<c-Up>"] = { "<cmd>winc k<cr>", "Go to up window" },
	["<c-j>"] = { "<cmd>winc j<cr>", "Go to down window" },
	["<c-Down>"] = { "<cmd>winc j<cr>", "Go to down window" },
	["<c-l>"] = { "<cmd>winc l<cr>", "Go to right window" },
	["<c-Right>"] = { "<cmd>winc l<cr>", "Go to right window" },

	["<cs-h>"] = { "<cmd>vert res -1<cr>", "Decrease window width" },
	["<cs-Left>"] = { "<cmd>vert res -1<cr>", "Decrease window width" },
	["<cs-k>"] = { "<cmd>res -1<cr>", "Decrease window width" },
	["<cs-Up>"] = { "<cmd>res -1<cr>", "Decrease window width" },
	["<cs-j>"] = { "<cmd>res +1<cr>", "Increase window height" },
	["<cs-Down>"] = { "<cmd>res +1<cr>", "Increase window height" },
	["<cs-l>"] = { "<cmd>vert res +1<cr>", "Increase window height" },
	["<cs-Right>"] = { "<cmd>vert res +1<cr>", "Increase window height" },
})
