vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.clipboard = "unnamedplus"
vim.opt.cul = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = false -- true is not good for commenting yaml
vim.opt.fillchars = { eob = " " }
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 4
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.showmode = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.laststatus = 3
vim.opt.statusline = " "
vim.opt.cmdheight = 1

vim.opt.foldenable = true
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 2

vim.opt.wildignorecase = true
vim.opt.wildignore = {
	".git",
	".hg",
	".svn",
	"*.pyc",
	"*.o",
	"*.out",
	"*.jpg",
	"*.jpeg",
	"*.png",
	"*.gif",
	"*.zip",
	"**/tmp/**",
	"*.DS_Store",
	"**/node_modules/**",
	"**/bower_modules/**",
}

-- interval for writing swap file to disk, also used by gitsigns
vim.opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

-- disable nvim intro
vim.opt.shortmess:append("sI")
