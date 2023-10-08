return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
--		"hrsh7th/cmp-vsnip",
--		"hrsh7th/vim-vsnip",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
--					vim.fn["vsnip#anonymous"](args.body)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
--				{ name = "vsnip" },
				{ name = "luasnip" },
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
		vim.keymap.set("i", "<c-down>", function()
			require("cmp").scroll_docs(4)
		end)
		vim.keymap.set("i", "<c-up>", function()
			require("cmp").scroll_docs(-4)
		end)
	end,
	lazy = true,
	event = {
		"BufRead *.cpp", "BufRead *.h",
		"BufRead *.rs",
		"BufRead *.lua",
		"BufRead *.gd", "BufRead *.gdscript", "BufRead *.gdscript3",
		"BufRead *.cs",
		"BufRead *.p8",
	},
}
