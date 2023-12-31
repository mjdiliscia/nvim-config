return {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			filetype = {
				lua = { require("formatter.filetypes.lua").stylua },
				rust = { require("formatter.filetypes.rust").rustfmt },
				cpp = { require("formatter.filetypes.cpp").clangformat },
				cs = { require("formatter.filetypes.cs").dotnetformat },
			},
		})
	end,
	lazy = true,
	event = {
		"BufRead *.lua",
		"BufRead *.rs",
		"BufRead *.cpp", "BufRead *.h",
		"BufRead *.cs"
	}
}
