return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		local lldbport = 12345
		dap.adapters.codelldb = {
			type = "server",
			port = "${lldbport}",
			executable = {
				command = "codelldb",
				args = { "--port", "${lldbport}" },
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

		dap.adapters.godot = {
			type = "server",
			port = "6006",
			host = "127.0.0.1",
		}
		dap.configurations.gdscript = {
			{
				name = "Launch scene",
				type = "godot",
				require = "launch",
				project = "${workspaceFolder}",
				launch_scene = true,
			}
		}
	end,
	lazy = true,
}
