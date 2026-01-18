local opt = vim.opt

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disable optional providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- turn on relative numbering
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- turn off wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- sets cursor to a line
opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- turn on the spell checker
opt.spelllang = "en_us"
opt.spell = true

-- turn on conceal
opt.conceallevel = 2

-- turn on folding
-- zA to toggle a fold completely, including nested folds
-- za to toggle only one level of folding
-- zR to open ALL folds in the file
-- zM to close all of them
-- zr to open one level more
-- zm to close one level more

vim.g.vimtex_fold_enabled = 1
vim.g.vimtex_fold_manual = 1

opt.fdm = "marker"
opt.foldcolumn = "1"
opt.foldmarker = "{{{,}}}"

-- turn off the pattern in the fold title
opt.fillchars = {
  vert = "▕", -- alternatives │
  fold = " ",
  eob = " ", -- suppress ~ at EndOfBuffer
  diff = "╱", -- alternatives = ⣿ ░ ─
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
}

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {
    "*.snippets",
  },
  callback = function()
    vim.opt_local.foldmethod = "marker"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "ini" },
  callback = function()
    vim.opt_local.commentstring = "; %s"
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- set recommended settings for auto-session
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
