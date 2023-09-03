return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").setup({})

		require('lint').linters_by_ft = {
			markdown = {"vale"},
--			lua = {"luacheck"},
			cpp = {"clangtidy"},
		}
		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
	lazy = true,
}