return {
	"hrsh7th/cmp-nvim-lsp",
	dependencies = {
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
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
		local lspconfig = require("lspconfig")

		lspconfig.clangd.setup({
			capabilities = capabilities,
		})

		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
		})

		lspconfig.gdscript.setup({
			capabilities = capabilities,
		})

		lspconfig.omnisharp.setup({
			capabilities = capabilities,
			cmd = { "/home/lorddrako/.local/share/nvim/mason/bin/omnisharp" },
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_init = function(client)
				client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = { vim.env.VIMRUNTIME },
						},
					}
				})
			end,
		})

		vim.cmd("e")
	end,
	lazy = true,
	event = {
		"BufRead *.cpp", "BufRead *.h",
		"BufRead *.rs",
		"BufRead *.lua",
		"BufRead *.gd", "BufRead *.gdscript", "BufRead *.gdscript3",
		"BufRead *.cs",
	},
}
