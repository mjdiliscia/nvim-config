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
		local luasnip = require("luasnip")
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
				["<C-Down"] = cmp.mapping.scroll_docs(4),
				["<C-Up>"] = cmp.mapping.scroll_docs(-4),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		local conditional_lspsetup = function(server, opts)
			local server_cfg = require("lspconfig.server_configurations." .. server)
			local cmd = server_cfg.default_config.cmd[1]
			if (vim.fn.executable(cmd) ~= 0) then
				lspconfig[server].setup(opts)
			end
		end

		conditional_lspsetup("clangd", {
			capabilities = capabilities,
		})

		conditional_lspsetup("rust_analyzer", {
			capabilities = capabilities,
		})

		lspconfig.gdscript.setup({
			capabilities = capabilities,
		})

		lspconfig.omnisharp.setup({
			capabilities = capabilities,
		})

		conditional_lspsetup("vala_ls", {
			capabilities = capabilities,
		})

		conditional_lspsetup("lua_ls", {
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
		local wk = require("which-key")
		wk.register({
			K = { vim.lsp.buf.hover, "Show symbol information" },
		})
		wk.register({
			c = {
				R = { vim.lsp.buf.rename, "Rename symbol" },
				a = { vim.lsp.buf.code_action, "Code actions" },
				D = { vim.diagnostic.open_float, "Line diagnostics" },
			},
		}, { prefix = "<leader>" })
--		vim.keymap.set("n", "K", vim.lsp.buf.hover)
--		vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename)
	end,
	lazy = true,
	event = {
		"BufRead *.cpp", "BufRead *.h",
		"BufRead *.rs",
		"BufRead *.lua",
		"BufRead *.gd", "BufRead *.gdscript", "BufRead *.gdscript3",
		"BufRead *.cs",
		"BufRead *.p8",
		"BufRead *.vala",
	},
}
