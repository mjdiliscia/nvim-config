return {
	"neovim/nvim-lspconfig",
--	config = function()
--		local coq = require("coq")
--		local lsp = require("lspconfig")
--
--		lsp.clangd.setup(coq.lsp_ensure_capabilities({}))
--		lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities({}))
--
--		vim.api.nvim_create_autocmd("LspAttach", {
--			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--			callback = function(ev)
--				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
--				local opts = { buffer = ev.buf }
--				vim.keymap.set('n', 'n', vim.lsp.buf.signature_help, opts)
--			end
--		})
--	end,
	lazy = true,
	priority = 60,
}
