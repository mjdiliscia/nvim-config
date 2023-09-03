local nvim_tree = require("nvim-tree.api")
vim.keymap.set("n", "<leader>e", nvim_tree.tree.toggle)
vim.keymap.set("n", "<leader>c", ":COQnow -s<CR>", { silent = true })
vim.keymap.set("n", "<leader>fs", ":Telescope grep_string<CR>", { silent = true })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope find_git<CR>", { silent = true })