local opt = vim.opt -- for conciseness

-- specify node and python envs
vim.g.python3_host_prog = "/Users/dkKirSwe/.config/.pyenv/versions/vim/bin/python"
vim.g.node_host_prog = "/Users/dkKirSwe/.nvm/versions/node/v18.14.1/bin/node"

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- show abs line number on cursor line

-- tabs & ident
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tabs to spaces
opt.autoindent = true -- copy indent for current line

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- assume you want case-sensitive search if using mixed case

-- cursor line
opt.cursorline = true -- high current cursor line

-- appearance
-- fancy colors
opt.termguicolors = true -- required for fancy themes
opt.background = "dark" -- colorscheme will use darkmode
opt.signcolumn = "yes" -- show sign column

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on these

-- clipboard
opt.clipboard:append("unnamedplus") -- use clipboard as default register

-- split windows
opt.splitright = true -- split open right of current
opt.splitbelow = true -- split opens below current

opt.iskeyword:append("-") -- consider string-string as word
