local opt = vim.opt
local g = vim.g

-- Be IMproved, required
opt.compatible = false
-- Disable cursor changing https://git.io/JfbFH
opt.guicursor = ""
-- For security
opt.modeline = false
-- Split horizontally and jump to the right
opt.splitbelow = true
-- Split vertically and jump down
opt.splitright = true
---------------------
-- Searching related
---------------------
-- Ignore case of normal letters
opt.ignorecase = true
-- Ignore case when pattern contains lowercase letters only
opt.smartcase = true
-- Highlight search things
opt.hlsearch = true
-- Make search act like search in modern browser
opt.incsearch = true
-- Show matching bracket
opt.showmatch = true
-- How many teths of a sec to blink
opt.mat = 2

---------------------
-- Buffer stuff
---------------------
-- Hide buffer when abandoned
-- Required for operations modifying multiple buffers
opt.hidden = true
-- Buffer screen updates
opt.lazyredraw = true
-- Time of inactivity before writing swap file to disk
opt.updatetime = 500 -- milliseconds
-- Show line numbers
opt.number = true

-----------------------------------------------
-- Indent and space
-----------------------------------------------
-- Set indent to be 4 spaces
opt.shiftwidth = 4
opt.tabstop = 2
-- Auto indent
opt.autoindent = true
-- Uses spaces to insert a tab
opt.expandtab = true
opt.smarttab = true
-- Lines with equal indent form a fold
opt.foldmethod = 'indent'
-- Start with no folds closed
opt.foldlevelstart = 99
-- Concealed text is hidden unless it has replacement defined
opt.conceallevel = 2
-- Hide mode message
opt.showmode = false
-- Suppress ins-completion-menu messages
opt.shortmess:append('c')
-- Enable mouse support
opt.mouse = 'a'

-- Suppress netrw history
g.netrw_dirhistmax = 0