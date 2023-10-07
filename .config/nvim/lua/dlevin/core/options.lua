local options = {
  hlsearch = false, -- highlight all matches on previous search pattern
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  mouse = "a", -- allow the mouse to be used in neovim
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  breakindent = true,
  undofile = true, -- enable persistent undo
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  ignorecase = true, -- ignore case in search pattern
  smartcase = true, -- smart case
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  updatetime = 250, -- faster completion (4000ms default)
  timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  termguicolors = true, -- set term gui colors (most terminals support this)
  background = "dark",
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  swapfile = false, -- creates a swapfile
  backup = false, -- creates a backup file
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program)
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces a tab
  softtabstop = 2,
  showtabline = 2, -- always show tabs
  wrap = false, -- display lines as one long line
  smartindent = true, -- make indenting smarter again
  autoindent = true,
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  cursorline = true, -- highlight the current line
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  backspace = "indent,eol,start",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
