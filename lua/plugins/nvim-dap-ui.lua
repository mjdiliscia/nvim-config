return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	confid = function()
		require("dapui").setup()
	end,
	lazy = true,
}
