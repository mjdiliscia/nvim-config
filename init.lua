function bootstrap_lazyvim()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
	end
	vim.opt.rtp:prepend(lazypath)
end

bootstrap_lazyvim()
vim.g.mapleader = " "
vim.wo.number = true

require("lazy").setup("plugins")
require("mappings")

vim.api.nvim_create_autocmd({"BufNew", "BufEnter"}, {
	pattern = { "*.p8" },
	callback = function(args)
		vim.lsp.start({
			name = "pico8-ls",
			cmd = { "pico8-ls", "--stdio" },
			root_dir = vim.fs.dirname(vim.api.nvim_buf_get_name(args.buf)),
			on_attach = on_attach,
		})
	end
})

