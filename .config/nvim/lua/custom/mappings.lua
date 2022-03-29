-- MAPPINGS
local map = require("core.utils").map

map("n", "<C-p>", ":Telescope find_files <CR>")
map("i", "jk", "<esc>")
map("n", "<leader>a", ':lua require("harpoon.mark").add_file() <CR>')
map("n", "<C-e>", ":Telescope harpoon marks <CR>")
map("n", "<leader>xx", "TroubleToggl<CR>")
