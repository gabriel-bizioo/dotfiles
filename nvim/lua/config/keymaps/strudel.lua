local map = vim.keymap.set
local strudel = require("strudel")

map("n", "<leader>sl", strudel.quit, { desc = "Launch Strudel" })
map("n", "<leader>sq", strudel.quit, { desc = "Quit Strudel" })
map("n", "<leader>st", strudel.toggle, { desc = "Strudel Toggle Play/Stop" })
map("n", "<leader>su", strudel.update, { desc = "Strudel Update" })
map("n", "<leader>ss", strudel.stop, { desc = "Strudel Stop Playback" })
map("n", "<leader>sb", strudel.set_buffer, { desc = "Strudel set current buffer" })
map("n", "<leader>sx", strudel.execute, { desc = "Strudel set current buffer and update" })

