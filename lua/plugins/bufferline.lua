return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local optFnc = function()
			local Offset = require("bufferline.offset")
			if not Offset.edgy then
				local get = Offset.get
				Offset.get = function()
					if package.loaded.edgy then
						local layout = require("edgy.config").layout
						local ret = { left = "", left_size = 0, right = "", right_size = 0, }
						for _, pos in ipairs({ "left", "right" }) do
							local sb = layout[pos]
							if sb and #sb.wins > 0 then
								local title = " Sidebar" ..
								    string.rep(" ", sb.bounds.width - 8)
								ret[pos] = "%#EdgyTitle#" ..
								    title .. "%*" .. "%#WinSeparator#│%*"
								ret[pos .. "_size"] = sb.bounds.width
							end
						end
						ret.total_size = ret.left_size + ret.right_size
						if ret.total_size > 0 then
							return ret
						end
					end
					return get()
				end
				Offset.edgy = true
			end
		end
		optFnc()

		require("bufferline").setup({
			options = {
				numbers = "id",
			},
		})

		local wk = require("which-key")
		wk.register({
			["<s-left>"] = { ":BufferLineCyclePrev<CR>", "Go to prev. file" },
			["<s-right>"] = { ":BufferLineCycleNext<CR>", "Go to next file" },
		})
		wk.register({
			b = {
				name = "Buffer operations",
				["1"] = { ":BufferLineGoToBuffer 1<CR>", "Go to file 1" },
				["2"] = { ":BufferLineGoToBuffer 2<CR>", "Go to file 2" },
				["3"] = { ":BufferLineGoToBuffer 3<CR>", "Go to file 3" },
				["4"] = { ":BufferLineGoToBuffer 4<CR>", "Go to file 4" },
				["5"] = { ":BufferLineGoToBuffer 5<CR>", "Go to file 5" },
				["6"] = { ":BufferLineGoToBuffer 6<CR>", "Go to file 6" },
				["7"] = { ":BufferLineGoToBuffer 7<CR>", "Go to file 7" },
				["8"] = { ":BufferLineGoToBuffer 8<CR>", "Go to file 8" },
				["9"] = { ":BufferLineGoToBuffer 9<CR>", "Go to file 9" },
				c = { ":bd<CR>", "Close current file" },
			},
		}, { prefix = "<leader>" })
	end,
}
