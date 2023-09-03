return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		local port = 12345
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "codelldb",
				args = { "--port", "${port}" },
			}
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			}
		}
		dap.configurations.rust = dap.configurations.cpp
	end,
	lazy = true,
}
