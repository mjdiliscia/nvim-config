return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	init = function()
		vim.opt.laststatus = 3
		vim.opt.splitkeep = "screen"
	end,
	config = function(plugin, opts)
		require("edgy").setup(opts)
	end,
	opts = {
		keys = {
			-- close window
			["<c-q>"] = function(win)
				win:close()
			end,
			-- hide window
			["q"] = function(win)
				win:hide()
			end,
		},
		options = {
			left = { size = 30 },
			right = { size = 40 },
		},
		bottom = {
			{
				ft = "toggleterm",
				size = { height = 0.4 },
				-- exclude floating windows
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},
			{
				ft = "lazyterm",
				title = "LazyTerm",
				size = { height = 0.4 },
				filter = function(buf)
					return not vim.b[buf].lazyterm_cmd
				end,
			},
			"Trouble",
			{ ft = "qf",            title = "QuickFix" },
			{
				ft = "help",
				size = { height = 20 },
				-- only show help buffers
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
			{ ft = "spectre_panel", size = { height = 0.4 } },
		},
		left = {
			-- Neo-tree filesystem always takes half the screen height
			{
				title = "Neo-Tree",
				ft = "neo-tree",
				filter = function(buf)
					return vim.b[buf].neo_tree_source == "filesystem"
				end,
				pinned = true,
				size = { height = 0.5 },
				open = "Neotree"
			},
			{
				title = "Neo-Tree Git",
				ft = "neo-tree",
				filter = function(buf)
					return vim.b[buf].neo_tree_source == "git_status"
				end,
				open = "Neotree git_status",
			},
		},
		right = {
			{
				title = "Neo-Tree Buffers",
				ft = "neo-tree",
				filter = function(buf)
					return vim.b[buf].neo_tree_source == "buffers"
				end,
				open = "Neotree buffers",
			},
			{
				ft = "Outline",
				pinned = true,
				open = "SymbolsOutlineOpen",
				size = { height = 0.7 },
			},
		},
	},
}
