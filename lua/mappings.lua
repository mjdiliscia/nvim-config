local wk = require("which-key")

wk.register({
	r = { function() vim.wo.relativenumber = not vim.wo.relativenumber end, "Toggle relative numbering" },
}, { prefix = "<leader>" })
