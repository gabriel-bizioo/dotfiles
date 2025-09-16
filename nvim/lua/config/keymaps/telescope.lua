local map = vim.keymap.set

map("n", "<leader>fs", ":Telescope find_files<cr>")
map("n", "<leader>fp", ":Telescope git_files<cr>")
map("n", "<leader>fz", ":Telescope live_grep<cr>")
map("n", "<leader>fo", ":Telescope oldfiles<cr>")
