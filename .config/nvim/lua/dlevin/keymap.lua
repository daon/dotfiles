local keymap = vim.api.nvim_set_keymap
local cmd = vim.cmd
local options = { noremap = true, silent = true }
local silent = { silent = true }

-- Close buffer
cmd([[ autocmd BufEnter * nmap <silent> <buffer> <leader>q :bd<CR> ]])

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"man",
		"help",
		"lspinfo",
		"null-ls-info",
		"lsp-installer",
	},
	command = "nnoremap <silent> <buffer> <leader>q :close<CR>",
})

-- map ctrl+z to nothing so that it don't suspend terminal
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "nnoremap <C-z> <nop>",
})

-- window navigation
-- keymap("n", "<C-h>", "<C-w>h", options)
-- keymap("n", "<C-j>", "<C-w>j", options)
-- keymap("n", "<C-k>", "<C-w>k", options)
-- keymap("n", "<C-l>", "<C-w>l", options)

-- map ctrl+s to save file
keymap("i", "<C-s>", "<ESC>ma<ESC>:w <CR>`a", options)
keymap("n", "<C-s>", "<ESC>ma<ESC>:w <CR>`a", options)

-- scroll window up/down
keymap("i", "<C-e>", "<ESC><C-e>", silent)
keymap("i", "<C-y>", "<ESC><C-y>", silent)

-- scroll window left/right
keymap("n", "<C-h>", "zh", silent)
keymap("n", "<C-l>", "zl", silent)

-- number line enable
keymap("n", "<leader>n", ":set rnu! <CR>", silent)

-- clear search results
keymap("n", "??", ":noh <CR>", silent)

-- close all other windows
keymap("n", "<M-q>", ":only<CR>", silent)

-- resize up/down
keymap("n", ";k", ":resize +3 <CR>", options)
keymap("n", ";j", ":resize -3 <CR>", options)

-- resize right/left
keymap("n", ";l", ":vertical resize -3 <CR>", options)
keymap("n", ";h", ":vertical resize +3 <CR>", options)

-- moving code blocks
keymap("v", "<", "<gv", options)
keymap("v", ">", ">gv", options)

-- switch to normal mode
keymap("t", "<ESC>", "<C-\\><C-n>", options)

-- move selected line(s) up or down
keymap("v", "J", ":m '>+1<CR>gv=gv", options)
keymap("v", "K", ":m '<-2<CR>gv=gv", options)

-- smart deletion, dd
local function smart_dd()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end
vim.keymap.set("n", "dd", smart_dd, { noremap = true, expr = true })
