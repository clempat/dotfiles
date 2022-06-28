-- MAPPINGS
local M = {}

M.all = {
	n = {
		["<C-p>"] = { ":Telescope find_files <CR>", "Find Files with Telescope" },
		["<leader>a"] = { ":lua require('harpoon.mark').add_file() <CR>", "Add mark to harpoon" },
		["<C-e>"] = { ":Telescope harpoon marks <CR>", "List marks from harpoon" },
		["<leader>xx"] = { "TroubleToggl<CR>", "I forgot" },
		["<c-u>"] = { "i<c-r>=trim(system('uuidgen'))<cr><esc>", "Generate uuid when normal mode" },
	},
	i = {
		["<c-u>"] = { "<c-r>=trim(system('uuidgen'))<cr>", "Generate uuid when insert mode" },
		["jk"] = { "<ESC>", "Escape with jk" },
	},
}

return M
