return {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			filetype = {
				lua = { require("formatter.filetypes.lua").stylua },
				rust = { require("formatter.filetypes.rust").rustfmt },
				cpp = { require("formatter.filetypes.cpp").clangformat },
			},
		})
	end,
	lazy = true,
	event = { "BufEnter *.lua", "BufEnter *.rs", "BufEnter *.cpp", "BufEnter *.h" }
}
