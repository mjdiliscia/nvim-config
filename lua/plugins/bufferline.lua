return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function ()
		require("bufferline").setup({
			options = {
				numbers = "ordinal",
			},
		})

		local wk = require("which-key")
		wk.register({
			b = {
				name = "Buffer operations",
				["<left>"] = { ":BufferLineCyclePrev<CR>", "Go to prev. file" },
				["<right>"] = { ":BufferLineCycleNext<CR>", "Go to next file" },
				["1"] = { ":BufferLineGoToBuffer 1<CR>", "Go to file 1" },
				["2"] = { ":BufferLineGoToBuffer 2<CR>", "Go to file 2" },
				["3"] = { ":BufferLineGoToBuffer 3<CR>", "Go to file 3" },
				["4"] = { ":BufferLineGoToBuffer 4<CR>", "Go to file 4" },
				["5"] = { ":BufferLineGoToBuffer 5<CR>", "Go to file 5" },
				["6"] = { ":BufferLineGoToBuffer 6<CR>", "Go to file 6" },
				["7"] = { ":BufferLineGoToBuffer 7<CR>", "Go to file 7" },
				["8"] = { ":BufferLineGoToBuffer 8<CR>", "Go to file 8" },
				["9"] = { ":BufferLineGoToBuffer 9<CR>", "Go to file 9" },
				c = { ":bd<CR>", "Close current file" },
			},
		}, { prefix = "<leader>" } )
	end,
}
