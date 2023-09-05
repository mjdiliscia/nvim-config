return {
	"hrsh7th/cmp-nvim-lsp",
	dependencies = {
		"hrsh7th/nvim-cmp",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "vsnip" },
				{ name = "nvim-lsp-signature-help" },
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
		})
		
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		
		require("lspconfig").clangd.setup({
			capabilities = capabilities,
		})

		vim.cmd("e")
	end,
	lazy = true,
	event = { "BufRead *.cpp", "BufRead *.h" },
}
